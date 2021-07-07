import 'package:flutter/material.dart';
import 'package:omicxvn/components/post/PostItemView.dart';
import 'package:omicxvn/notifiers/posts_notifier.dart';
import 'package:omicxvn/screens/add_post_screen.dart';
import 'package:omicxvn/screens/detail_screen.dart';
import 'package:omicxvn/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/home';
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<PostsNotifier>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPostScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<PostsNotifier>(
        builder: (context, posts, child) => Container(
          color: Colors.black12,
          child: ListView.builder(
              itemCount: posts.getPostList().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(0),
                  child: PostItem(post: posts.getPostList()[index]),
                  key: ObjectKey(posts.getPostList()[index]),
                );
              }),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
            Navigator.pushNamed(context, DetailScreen.routeName);
          }),
      drawer: MyDrawer(),
    );
  }
}
