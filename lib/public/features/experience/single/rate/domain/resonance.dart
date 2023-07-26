import 'package:read_with_meaning/shared/domain//experience.dart';

class Resonance extends Experience {
  const Resonance(
      {required super.id,
      required super.author,
      required super.createdAt,
      required this.link,
      required this.resonance // link to the original content
      })
      : super(type: "_resonance", content: resonance);
  final String link;
  final String resonance;
}
