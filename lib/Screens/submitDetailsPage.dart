import 'dart:async';
import 'dart:io';

import 'package:emerance/widgets/actionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:file_picker/src/file_picker.dart';
class submitDetailsPage extends StatefulWidget {
  const submitDetailsPage({Key? key}) : super(key: key);

  @override
  State<submitDetailsPage> createState() => _submitDetailsPageState();
}

class _submitDetailsPageState extends State<submitDetailsPage> {
//   late File _image;
//  // List<File>_images = [];
//   final imagePicker = ImagePicker();
// Future<void> _pickImage() async {
//   // Pick an image from the gallery
//   final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//
//   setState(() {
//     _image=pickedFile.path;
//   });
// }
  final ImagePicker _picker = ImagePicker();
  void _pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

    if (mounted && file != null) {
      imgPath = file.path;
      setState(() {

      });
      // Navigator.push(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => VideoEditor(file: File(file.path)),
      //   ),
      // );
    }
  }

  String imgPath = '';
  var lyricFile = null;
  var lrcFilePath = null;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFebebeb),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFebebeb),
          leading: const BackButton(
            color: Colors.black87,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Enter Proper Details",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                // height: MediaQuery.of(context).size.height*0.15,
                // width: MediaQuery.of(context).size.width*0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffd5dce3),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Enter details',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            imgPath == null
                ? Container()
                : Container(
                    // child: Image.file(File(imgPath)),
                  ),
            const Center(
              child: Text(
                "Add Image",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _pickImage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imgPath==''
                  ?Container()
                  :Container(
                    child: Image.file(height:70,File(imgPath)),
                  ),
                  Icon(
                    CupertinoIcons.plus_app_fill,
                    size: 90,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const actionButton(
              height: 0.05,
              width: 0.4,
              route: '/approval',
              title: 'Submit',
            ),
          ],
        ));
  }
}
