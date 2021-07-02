import 'package:omicxvn/models/Post.dart';

abstract class IPostRepository {
  Future<List<Post>> getPost();
  Future<bool> addPost(Post post);
}
