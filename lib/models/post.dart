import 'dart:convert';

class Post {
  int id;
  int userId;
  String body;
  String title;
  Post({
    required this.id,
    required this.userId,
    required this.body,
    required this.title,
  });

  static empty() {
    return Post(
      body: '',
      id: 0,
      title: '',
      userId: 0,
    );
  }

  Post copyWith({
    int? id,
    int? userId,
    String? body,
    String? title,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      body: body ?? this.body,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'body': body,
      'title': title,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      userId: map['userId'],
      body: map['body'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, body: $body, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.userId == userId &&
        other.body == body &&
        other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ body.hashCode ^ title.hashCode;
  }
}
