import 'package:omicxvn/models/post.dart';
import 'package:omicxvn/notifiers/PostsNotifier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String API_ENDPOINT =
      "https://jsonplaceholder.typicode.com/posts";

  static getPosts(PostsNotifier postsNotifier) {
    http.get(Uri.parse(API_ENDPOINT)).then((response) {
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        List<Post> postList =
            List.from(data).map<Post>((post) => Post.fromMap(post)).toList();
        postsNotifier.setPostList(postList);
      }
    });
  }

  static Future<bool> addPost(Post post, PostsNotifier postsNotifier) async {
    http
        .post(Uri.parse(API_ENDPOINT),
            headers: {
              "Content-type": "application/json; charset=UTF-8",
            },
            body: json.encode(post.toMap()))
        .then((response) {
      if (response.statusCode == 201) {
        postsNotifier.addPostToList(post);
        return true;
      }
    });
    return false;
  }
}
