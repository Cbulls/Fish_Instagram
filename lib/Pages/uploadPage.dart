import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Store/homeData.dart';

class Upload extends StatefulWidget {
  Upload({Key? key, this.image, this.uploadData}) : super(key: key);
  late final image;
  final uploadData;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var textController = TextEditingController();
  var now = DateTime.now();

  showImage(){
    if(widget.image != null){
      return Image.file(widget.image);
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('이미지 업로드 페이지'),
              Text('날짜 : ${DateFormat('MMM dd').format(now)}'),
              Text(''),
              showImage(),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: '설명'
                ),
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)
              ),
              IconButton(
                  onPressed: (){
                    context.read<HomeData>().putData(widget.image, textController.text, now);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.add)
              ),
            ],
          ),
        )
    );

  }
}