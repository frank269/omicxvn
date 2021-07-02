import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/interfaces/IPostRepository.dart';
import 'package:omicxvn/models/Post.dart';

@Singleton(as: IPostRepository, env: [Environment.dev])
class DevPostRepository implements IPostRepository {
  @override
  Future<bool> addPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<List<Post>> getPost() async {
    var postList = List<Post>.generate(
      10,
      (index) => Post(
        body: 'body $index',
        id: index,
        title: 'title $index',
        userId: 2,
      ),
    );
    return postList;
  }
}
