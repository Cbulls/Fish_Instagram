import 'package:flutter/material.dart';
import '../Pages/uploadPage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TopAppBar extends StatefulWidget with PreferredSizeWidget{
  TopAppBar({Key? key, this.uploadData}) : super(key: key);
  final uploadData;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  var selectedImage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Instagram'),
      actions: [
        IconButton(
            onPressed: () async{
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if(image != null) {
                setState(() {
                  selectedImage = File(image.path);
                });
              }
              if (!mounted) return;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Upload(image: selectedImage, uploadData: widget.uploadData,))
              );
            },
            icon: Icon(Icons.add_box_outlined)
        )
      ],
    );
  }
}
