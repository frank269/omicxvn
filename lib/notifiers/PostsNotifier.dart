import 'package:flutter/foundation.dart';
import 'package:omicxvn/models/post.dart';

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

  Future<bool> uploadPost(Post post) async {
    await Future.delayed(Duration(seconds: 2));
    addPostToList(post);
    return true;
  }
}
