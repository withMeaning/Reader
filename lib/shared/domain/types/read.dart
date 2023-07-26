// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';

class Read extends Experience {
  const Read({
    required super.id,
    required super.author,
    required super.createdAt,
    required this.title, // is mapped to content
    // extra fields
    required this.mainContent,
    required this.source, // the RSS feed URL, or "Twitter, YouTube, etc."
    required this.link, // link to the original content
    this.summary, // summary of the content
  }) : super(type: "read", content: title);
  final String title;
  final String mainContent;
  final String source;
  final String link;
  final String? summary;

  @override
  String toString() {
    return 'Read(title: $title, mainContent: $mainContent, source: $source, link: $link, summary: $summary)';
  }

  factory Read.fromReadEntry(ReadEntry entry) {
    return Read(
      id: entry.id,
      author: entry.author,
      createdAt: entry.createdAt,
      title: entry.title,
      mainContent: entry.mainContent,
      source: entry.source,
      link: entry.link,
      summary: entry.summary,
    );
  }
}
