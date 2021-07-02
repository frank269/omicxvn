import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/interfaces/IPostRepository.dart';
import 'package:omicxvn/models/Post.dart';
import 'package:omicxvn/utils/ApiUtils.dart';

@Singleton(as: IPostRepository, env: [Environment.prod])
class ProdPostRepository implements IPostRepository {
  final String API_ENDPOINT = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<bool> addPost(Post post) async {
    var response = await ApiUtils.sendPost(API_ENDPOINT, post, {
      'Content-type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 500) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Post>> getPost() async {
    var response = await ApiUtils.sendGet(API_ENDPOINT, {});
    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      var postList =
          List.from(data).map<Post>((post) => Post.fromMap(post)).toList();
      return postList;
    }
    return List.empty();
  }
}
