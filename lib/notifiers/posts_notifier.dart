import 'package:flutter/foundation.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/interfaces/postRepository.dart';
import 'package:omicxvn/models/Post.dart';

class PostsNotifier with ChangeNotifier {
  List<Post> _postList = [];
  addPostToList(Post post) {
    _postList.add(post);
    notifyListeners();
  }

  setPostList(List<Post> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  clearPostList() {
    _postList = [];
    notifyListeners();
  }

  List<Post> getPostList() {
    return _postList;
  }

  void getData() async {
    _postList = await getIt<IPostRepository>().getPost();
    notifyListeners();
  }

  Future<bool> uploadPost(Post post) async {
    var result = await getIt<IPostRepository>().addPost(post);
    if (result) {
      addPostToList(post);
    }
    return result;
  }
}
