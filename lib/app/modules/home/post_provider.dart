import 'dart:convert';
import 'package:get/get.dart';
import '/app/core/utils/base_controller.dart';
import '/app/core/utils/utils.dart';
import '/app/data/models/models.dart';

class PostProvider with BaseController {
  final String BASE_API = 'jsonplaceholder.typicode.com';
  final String POST_LOAD_PATH = 'posts';

  Future<List<Post>> getPosts() async {
    var response = await ApiUtils.sendGet(
      base: BASE_API,
      path: POST_LOAD_PATH,
    ).catchError(handleError);
    if (response != null) {
      return List.from(response)
          .map<Post>((post) => Post.fromMap(post))
          .toList();
    }
    return List<Post>.empty();
  }
}
