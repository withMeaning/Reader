class Experience {
  const Experience({
    required this.id,
    required this.author,
    required this.createdAt,
    required this.content,
    required this.type,
  });
  final String id;
  final String author;
  final DateTime createdAt; // timestamp
  final String content;
  final String type;
}
