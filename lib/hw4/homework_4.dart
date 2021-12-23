import 'package:Homeworks/hw4/posts_store.dart';
import 'package:flutter/material.dart';

import 'add_new_post_screen.dart';
import 'home_page.dart';

class HomeWork4 extends StatefulWidget {
  const HomeWork4({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork4State createState() => _HomeWork4State();
}

class _HomeWork4State extends State<HomeWork4> {
  @override
  Widget build(BuildContext context) {
    return const MainScaffold();
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final PostsStore postsStore = PostsStore();
  final int _tabSelectedIndex = 0;
  late ScrollController _scrollController;

  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  Widget _buildBody() {
    switch (_tabSelectedIndex) {
      default:
        _scrollController = ScrollController(initialScrollOffset: 0);
        return HomePage(
            scrollController: _scrollController, postsStore: postsStore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey[50],
          title: Row(
            children: <Widget>[
              const SizedBox(width: 10.0),
              GestureDetector(
                child: const Text(
                  'Instagram',
                  style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Font'),
                ),
                onTap: _scrollToTop,
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            GestureDetector(
              child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("resources/icons/add.png")),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AddNewPostScreen(postsStore: postsStore))),
            ),
            const SizedBox(width: 32.0),
            GestureDetector(
              child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: ImageIcon(
                      AssetImage("resources/icons/messenger.png"),
                      size: 24,
                      color: Colors.black))
            ),
            const SizedBox(width: 16.0)
          ],
        ),
        body: _buildBody());
  }
}
