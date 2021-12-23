import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_screen.dart';

class HomeWork3 extends StatefulWidget {
  const HomeWork3({Key? key, required this.title}) : super(key: key);

  static const routeName = '/hw3';
  final String title;



  @override
  _HomeWork3State createState() => _HomeWork3State();
}

class _HomeWork3State extends State<HomeWork3> {
  List<String> mediaList = [];

  //late File _image;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(mediaList.length, (index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        _showImage(index);
                      },
                      child: Image.file(File(mediaList[index]),
                          width: 200.0, height: 200.0, fit: BoxFit.fitHeight),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.camera),
                      iconSize: 50,
                      onPressed: () {
                        _addImageFromCamera();
                      },
                    ),
                    // Text('Camera');
                    IconButton(
                      icon: const Icon(Icons.image_rounded),
                      iconSize: 50,
                      onPressed: () {
                        _addImageFromGallery();
                      },
                    ),
                    // Text('Camera');
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addImageFromGallery() async {
    XFile? image = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100));

    setState(() {
      mediaList.add(image!.path);
    });
  }

  void _addImageFromCamera() async {
    XFile? image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100));
    setState(() {
      mediaList.add(image!.path);
    });
  }

  void _showImage(int index) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImageScreen(imagePath: mediaList[index])));
  }
}
