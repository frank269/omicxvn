import 'package:flutter/material.dart';
import 'package:omicxvn/models/post.dart';
import 'package:omicxvn/notifiers/PostsNotifier.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  static final String routeName = "/addpost";
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  Post _post = Post.empty();

  _showSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 500),
    ));
  }

  _createPost(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      _showSnackBar("Failed to create Post", context);
      return;
    }
    _formKey.currentState?.save();
    _post.userId =
        1; // this is hard coded currently as we don't have authService

    PostsNotifier postNotifier =
        Provider.of<PostsNotifier>(context, listen: false);
    _post.id = postNotifier.getPostList().length + 1;
    postNotifier.uploadPost(_post).then((value) {
      if (value) {
        _showSnackBar("post added successfully", context);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a Post"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<PostsNotifier>(context, listen: false)
                  .clearPostList();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32, top: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Post title",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Post title cannot be empty';
                  }

                  if (value.length < 5 || value.length > 50) {
                    return 'Post title must be between 5 and 50 characters';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _post.title = value ?? "";
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32, top: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Post Body",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Post body cannot be empty';
                  }

                  if (value.length < 5 || value.length > 100) {
                    return 'Post body must be between 5 and 100 characters';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _post.body = value ?? "";
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  _createPost(context);
                },
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
