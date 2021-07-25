import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'addpost_controller.dart';

class AddPostScreen extends GetView<AddPostController> {
  final _formKey = GlobalKey<FormState>();

  _createPost(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      controller.createNewPost();
    }
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
                controller: controller.titleTextController,
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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32, top: 16),
              child: TextFormField(
                controller: controller.bodyTextController,
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
