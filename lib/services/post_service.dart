import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/interfaces/postRepository.dart';
import 'package:omicxvn/models/Post.dart';
import 'base_service.dart';

@Singleton(as: IPostRepository, env: [Environment.prod])
class ProdPostRepository implements IPostRepository {
  final String API_ENDPOINT = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<bool> addPost(Post post) async {
    var response = await BaseSevice.sendPostRequest(API_ENDPOINT, post, {
      'Content-type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Post>> getPost() async {
    var response = await BaseSevice.sendGetRequest(API_ENDPOINT, {});
    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      var postList =
          List.from(data).map<Post>((post) => Post.fromMap(post)).toList();
      return postList;
    }
    return List.empty();
  }
}

@Singleton(as: IPostRepository, env: [Environment.dev])
class DevPostRepository implements IPostRepository {
  @override
  Future<bool> addPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<List<Post>> getPost() async {
    var postList = [
      Post(body: 'body 1', id: 1, title: 'title 1', userId: 2),
      Post(body: 'body 2', id: 2, title: 'title 2', userId: 2),
      Post(body: 'body 3', id: 3, title: 'title 3', userId: 2),
      Post(body: 'body 4', id: 4, title: 'title 4', userId: 2),
      Post(body: 'body 5', id: 5, title: 'title 5', userId: 2),
    ];
    return postList;
  }
}
