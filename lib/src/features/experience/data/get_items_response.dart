import 'dart:convert';

class GetItemsResponse {
  GetItemsResponse({
    required this.items,
    required this.updatedAt,
  });
  final String updatedAt;
  final List<dynamic> items;

  factory GetItemsResponse.fromMap(Map<String, dynamic> map) {
    return GetItemsResponse(
      updatedAt: map['updateAt'] as String,
      items: map['items'] as dynamic,
    );
  }
  factory GetItemsResponse.fromJson(String source) =>
      GetItemsResponse.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class GetItem {
  GetItem({
    required this.uid,
    required this.type,
    this.author,
    this.createdAt,
    this.content,
    this.title,
    this.archived,
    this.link,
  });
  final String uid;
  final String type;
  final String? author;
  final String? createdAt;
  final String? content;
  final String? title;
  final bool? archived;
  final String? link;

  factory GetItem.fromMap(Map<String, dynamic> map) {
    return GetItem(
      uid: map['uid'] as String,
      type: map['type'] as String,
      author: map['author'] as String,
      createdAt: map['created_at'] as String,
      content: map['content'] as String,
      title: map['title'] as String,
      archived: map['archived'] as int == 1 ? true : false,
      link: map['link'] as String,
    );
  }
  factory GetItem.fromJson(String source) =>
      GetItem.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
