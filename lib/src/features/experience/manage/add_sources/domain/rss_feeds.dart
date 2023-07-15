import '../../../../boot_up/login/domain/user.dart';

class RSSFeed {
  const RSSFeed({
    required this.rssId,
    required this.link,
    required this.subscribedByUserIds,
  });
  final String rssId;
  final bool link;
  final List<String> subscribedByUserIds;

  RSSFeed subscribe(User user) {
    return subscribedByUserIds.contains(user.userId)
        ? this
        : RSSFeed(
            rssId: rssId,
            link: link,
            subscribedByUserIds: subscribedByUserIds..add(user.userId),
          );
  }

  RSSFeed unsubscribe(User user) {
    return !subscribedByUserIds.contains(user.userId)
        ? this
        : RSSFeed(
            rssId: rssId,
            link: link,
            subscribedByUserIds: subscribedByUserIds..remove(user.userId),
          );
  }
}
