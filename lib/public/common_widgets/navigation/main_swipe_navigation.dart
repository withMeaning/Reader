import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/common_widgets/full_screen.dart';
import 'package:read_with_meaning/public/common_widgets/navigation/swipeable_icon.dart';

// we first create an abstract class
// that takes a controller, so our child can be ListView, SingleChildScrollView, etc.

abstract class ScrollableWidget extends ConsumerStatefulWidget {
  const ScrollableWidget({super.key});
  Widget rebuildWithScrollController(ScrollController controller);
}

class MainSwipeNavigation extends StatefulWidget {
  const MainSwipeNavigation(
      {super.key,
      required this.child,
      this.leftIcon,
      required this.centerIcon,
      this.rightIcon,
      this.leftCallback,
      required this.centerCallback,
      this.rightCallback});

  final Widget child;
  final IconData? leftIcon;
  final IconData centerIcon;
  final IconData? rightIcon;
  final Function? leftCallback;
  final Function centerCallback; // function called onPanEnd
  final Function? rightCallback;

  @override
  State<MainSwipeNavigation> createState() => _MainSwipeNavigationState();
}

class _MainSwipeNavigationState extends State<MainSwipeNavigation> {
  ScrollController scrollController = ScrollController();
  double scrollVelocityY = 0.0;

  double topPosition = 0;
  bool isNewPan = true;
  int isGoingToBeHoritontal = 0;
  double panY = 0;
  double panX = 0;
  double menuXposition =
      0; // determines which of the 3 menu icons is selected, 0 if left, 1 if center, 2 if right, double if in transition

  late Widget eitherChild;
  @override
  void initState() {
    super.initState();
    eitherChild = (widget.child is ScrollableWidget)
        ? (widget.child as ScrollableWidget)
            .rebuildWithScrollController(scrollController)
        : widget.child;
    Logger().d("type ${eitherChild.runtimeType}");
  }

  reset() {
    setState(() {
      //topPosition = 0;
      //mainTextScrollable = false;
      isNewPan = true;
      isGoingToBeHoritontal = 0;
      panX = 0;
      panY = 0;
      menuXposition = 1;
    });
  }

  resetPosition() {
    setState(() {
      topPosition = 0;
    });
  }

  onPanStart(DragStartDetails details) {
    // check if the scroll of the child is in the top position
    if (scrollController.offset == 0) {
      Logger().d("Top! $details");
    } else {}
  }

  onPanUpdate(DragUpdateDetails details) {
    double newOffset = scrollController.offset - details.delta.dy;
    // Clamping scroll offset within the scrollable bounds
    if (newOffset < 0) {
      newOffset = 0;
    } else if (newOffset > scrollController.position.maxScrollExtent) {
      newOffset = scrollController.position.maxScrollExtent;
    }
    scrollController.position.jumpTo(newOffset);
    final screenWidth = MediaQuery.of(context).size.width;
    setState(() {
      panY += details.delta.dy;
      panX += details.delta.dx;
    });

    if (isNewPan) {
      setState(() {
        if ((details.localPosition.dx / screenWidth).clamp(0, 1) < (1 / 3)) {
          menuXposition = 0;
        } else if ((details.localPosition.dx / screenWidth).clamp(0, 1) >
                (1 / 3) &&
            (details.localPosition.dx / screenWidth).clamp(0, 1) < (2 / 3)) {
          menuXposition = 1;
        } else if ((details.localPosition.dx / screenWidth).clamp(0, 1) >
            (2 / 3)) {
          menuXposition = 2;
        } else {
          menuXposition = 1;
        }
      });

      isGoingToBeHoritontal += details.delta.dx.toInt();
    } else {
      setState(() {
        menuXposition =
            (details.localPosition.dx / screenWidth).clamp(0, 1) * 2;
      });
    }
  }

  onPanEnd(DragEndDetails details, WidgetRef ref) {
    scrollVelocityY = details.velocity.pixelsPerSecond.dy;
    double finalOffset = scrollController.offset - scrollVelocityY;
    // Clamping scroll offset within the scrollable bounds
    if (finalOffset < 0) {
      finalOffset = 0;
    } else if (finalOffset > scrollController.position.maxScrollExtent) {
      finalOffset = scrollController.position.maxScrollExtent;
    }
    // TODO: lock the direction (up/down)
    scrollController.animateTo(finalOffset,
        duration: const Duration(milliseconds: 700), curve: Curves.decelerate);
    Logger().i("Pan End");
    if (menuXposition < 0.5 && panY > 150) {
      Logger().i("Left Navigation");
      widget.leftCallback!();
    } else if (menuXposition > 0.5 && menuXposition < 1.5 && panY > 150) {
      Logger().i("Center Navigation");
      widget.centerCallback();
    } else if (menuXposition > 1.5 && panY > 150) {
      Logger().i("Right Navigation");
      widget.rightCallback!();
    } else {
      // do nothing
      Logger().i("Do Nothing");
    }
    if (panY > 0) {
      resetPosition();
    }
    reset();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: (details) {
          onPanEnd(details, ref);
        },
        child: Stack(
          children: [
            FullScreenNoAppBar(
                child: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Transform.translate(
                offset: Offset(
                    0,
                    panY.clamp(0, MediaQuery.of(context).size.height / 6) -
                        100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.leftIcon is IconData
                        ? SwipeableIcon(
                            isSelected: menuXposition < 0.5 && panY > 150,
                            opacity: menuXposition < 0.5
                                ? (1.2 - menuXposition.clamp(0.2, 0.5))
                                    .clamp(0.7, 1)
                                : 0.2,
                            labelText: "Refresh",
                            icon: widget.leftIcon!,
                          )
                        : Container(),
                    SwipeableIcon(
                      isSelected: menuXposition > 0.5 &&
                          menuXposition < 1.5 &&
                          panY > 150,
                      opacity: menuXposition > 0.5 && menuXposition < 1.5
                          ? (1.2 - (menuXposition - 1).abs()).clamp(0.7, 1)
                          : 0.2,
                      labelText: "Today",
                      icon: widget.centerIcon,
                    ),
                    widget.rightIcon is IconData
                        ? SwipeableIcon(
                            isSelected: menuXposition > 1.5 && panY > 150,
                            opacity: menuXposition > 1.5
                                ? (1.2 - (menuXposition - 2).abs())
                                    .clamp(0.7, 1)
                                : 0.2,
                            labelText: "Search",
                            icon: widget.rightIcon!,
                          )
                        : Container(),
                  ],
                ),
              ),
            )),
            Transform.translate(
              offset: Offset(
                  0,
                  topPosition.clamp(-MediaQuery.of(context).size.height,
                      MediaQuery.of(context).size.height / 6)),
              child: FullScreen(child: eitherChild),
            )
          ],
        ),
      );
    });
  }
}

class MainSwipeNavigationAllDirections extends StatefulWidget {
  const MainSwipeNavigationAllDirections(
      {super.key,
      required this.child,
      this.childScrollController,
      this.topLeftIcon,
      required this.topCenterIcon,
      this.topRightIcon,
      this.topLeftCallback,
      required this.topCenterCallback,
      this.topRightCallback});

  final Widget child;
  final ScrollController? childScrollController;
  final IconData? topLeftIcon;
  final IconData topCenterIcon;
  final IconData? topRightIcon;
  final Function? topLeftCallback;
  final Function topCenterCallback;
  final Function? topRightCallback;

  @override
  State<MainSwipeNavigationAllDirections> createState() =>
      _MainSwipeNavigationAllDirectionsState();
}

class _MainSwipeNavigationAllDirectionsState
    extends State<MainSwipeNavigationAllDirections> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
