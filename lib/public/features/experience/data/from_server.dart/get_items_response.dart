import 'dart:convert';

class GetItemsResponse {
  GetItemsResponse({
    required this.items,
  });
  // TODO this is a list of GetItem, not dynamic
  final List<dynamic> items;

  factory GetItemsResponse.fromMap(Map<String, dynamic> map) {
    return GetItemsResponse(
      items: map['items'] as dynamic,
    );
  }
  factory GetItemsResponse.fromJson(String source) =>
      GetItemsResponse.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class GetItem {
  GetItem({
    required this.uid,
    this.uiuid,
    required this.type,
    this.author,
    this.createdAt,
    this.content,
    this.title,
    this.summary,
    this.link,
    this.userEmail,
  });
  final String uid;
  final String type;
  final String? uiuid;
  final String? author;
  final String? createdAt;
  final String? summary;
  final String? content;
  final String? title;
  // final bool? archived;
  final String? userEmail;
  final String? link;

  factory GetItem.fromMap(Map<String, dynamic> map) {
    return GetItem(
      uid: map['uid'] as String,
      type: map['type'] as String,
      author: map['author'] as String?,
      createdAt: map['created_at'] as String?,
      content: map['content'] as String?,
      summary: map['summary'] as String?,
      title: map['title'] as String?,
      userEmail: map['user_email'] as String?, //int == 1 ? true : false,
      link: map['link'] as String?,
    );
  }
  factory GetItem.fromJson(String source) =>
      GetItem.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
