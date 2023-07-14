// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//generated code
// TODO undersand this
class User {
  String userId;
  String username;
  String email;
  String privateKey;
  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.privateKey,
  });

  User copyWith({
    String? userId,
    String? username,
    String? email,
    String? privateKey,
  }) {
    return User(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      privateKey: privateKey ?? this.privateKey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'username': username,
      'email': email,
      'privateKey': privateKey,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      privateKey: map['privateKey'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(userId: $userId, username: $username, email: $email, privateKey: $privateKey)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
    return other.userId ==
        userId; // TODO is this the correct way to check equality? Only care about primary key userId
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ privateKey.hashCode;
}
