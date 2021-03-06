import 'package:first_project/homework_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homeworks',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Stepan Ponomarev Homeworks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                        title: const Text(
                          'Домашняя работа 1',
                          style: TextStyle(color: Colors.deepPurple, fontSize: 24),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                              const HomeWork1(title: 'Домашняя работа 1')));
                        }),
                    // ListTile(
                    //     title: const Text(
                    //       'Домашняя работа 2',
                    //       style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    //     ),
                    //     onTap: () {
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (context) =>
                    //           const HomeWork2(title: 'Домашняя работа 2')));
                    //     }),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
