import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:omicxvn/models/Post.dart';
import 'package:omicxvn/notifiers/posts_notifier.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  static final String routeName = "/addpost";
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  Post _post = Post.empty();

  var isBusy = false;
  setBusy(bool isbusy) {
    if (this.mounted) {
      setState(() => isBusy = isbusy);
    }
  }

  _showSnackBar(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  _createPost(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      _showSnackBar('Failed to create Post');
      return;
    }
    setBusy(true);
    _formKey.currentState?.save();
    _post.userId =
        1; // this is hard coded currently as we don't have authService

    var postNotifier = Provider.of<PostsNotifier>(context, listen: false);
    _post.id = postNotifier.getPostList().length + 1;
    postNotifier.uploadPost(_post).then((value) {
      setBusy(false);
      if (value) {
        _showSnackBar('post added successfully');
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
              final templates = [
                TemplateGift,
                TemplateCamera,
                TemplateNotification,
                TemplateGeolocation,
                TemplateSuccess,
                TemplateFail,
                // TemplateOrangeRocket,
                TemplateGreenRocket,
                TemplateOrangeRocket2,
                TemplateCoin,
                TemplateBlueRocket,
                TemplateThumb,
                TemplateAuthentication,
                TemplateTerm,
                TemplateRedPacket,
              ];
              final popup = BeautifulPopup(
                context: context,
                template: templates[0],
              );
              popup.show(
                title: 'Chúc mừng năm mới',
                content: 'Chúc mừng bạn đã nhận được một món quà',
                actions: [
                  popup.button(
                    label: 'Close',
                    onPressed: Navigator.of(context).pop,
                  ),
                ],
                // bool barrierDismissible = false,
                // Widget close,
              );
              // Provider.of<PostsNotifier>(context, listen: false)
              //     .clearPostList();
              // Navigator.pop(context);
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
              child: isBusy
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
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
