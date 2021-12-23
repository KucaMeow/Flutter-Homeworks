import 'dart:io';

import 'package:Homeworks/hw4/posts_store.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewPostScreen extends StatefulWidget {
  final PostsStore postsStore;

  const AddNewPostScreen({Key? key, required this.postsStore})
      : super(key: key);

  @override
  _AddNewPostScreenState createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  final _textController = TextEditingController();
  PickedFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление нового поста"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 70, right: 70),
            child: buildImageOrButtonWidget(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: OutlinedButton(
              onPressed: () async {
                if (pickedFile != null) {
                  // XFile? image = (await ImagePicker()
                  //     .pickImage(source: ImageSource.camera, imageQuality: 100));
                  widget.postsStore.addPost(pickedFile!.path, _textController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text("Продолжить"),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImageOrButtonWidget() {
    if (pickedFile == null) {
      return GestureDetector(
        onTap: () {
          chooseImage();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: const ClipRRect(
            child: SizedBox(
                width: 300,
                height: 300,
                child: Icon(Icons.add, color: Colors.black)),
          ),
        ),
      );
    } else {
      return Image.file(
        File(pickedFile!.path),
        width: 300,
        height: 300,
      );
    }
  }

  getFromGallery() async {
    PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        this.pickedFile = pickedFile;
      });
    }
  }

  getFromCamera() async {
    PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        this.pickedFile = pickedFile;
      });
    }
  }

  chooseImage() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Выберите источник изображения'),
        content: const Text('Откуда вы хотите получить изображение'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              getFromGallery();
            },
            child: const Text('Галерея'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              getFromCamera();
            },
            child: const Text('Камера'),
          ),
        ],
      ),
    );
  }
}
