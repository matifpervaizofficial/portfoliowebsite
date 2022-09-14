// ignore_for_file: missing_required_param

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

// class ImageTest extends StatefulWidget {

//   @override
//   State<ImageTest> createState() => _ImageTestState();
// }


// XFile imageFile;
// List imagelist=[];

//   _openGallery() async {
//     imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {});
//   }
// class _ImageTestState extends State<ImageTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           mainAxisExtent: 2),
//           itemBuilder: (BuildContext context, int index){
//             return InkWell(
//               onTap: _openGallery(),
//             );
//           }),
//     );
//   }
// }
class SingleImageUpload extends StatefulWidget {
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
  List images = [];
  Future<XFile> imageFile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
        Expanded(
          child: buildGridView(),
        ),
      ],
    ),
  ),
);
  }

  Widget buildGridView() {
    return GridView.count(
  shrinkWrap: true,
  crossAxisCount: 3,
  childAspectRatio: 1,
  children: List.generate(images.length, (index) {
    if (images[index] is ImageUploadModel) {
      ImageUploadModel uploadModel = images[index];
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
           Image.file(
              uploadModel.imageFile,
              width: 300,
              height: 300,
            ),
            Positioned(
              right: 5,
              top: 5,
              child: InkWell(
                child: Icon(
                  Icons.remove_circle,
                  size: 20,
                  color: Colors.red,
                ),
                onTap: () {
                  setState(() {
                    images.replaceRange(index, index + 1, ['Add Image']);
                  });
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Card(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _onAddImageClick(index);
          },
        ),
      );
    }
  }),
);
  }

  Future _onAddImageClick(int index) async {
setState(() {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  getFileImage(index);
});
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

_imageFile.then((Xfile) async {
  setState(() {
    ImageUploadModel imageUpload = new ImageUploadModel();
    imageUpload.isUploaded = false;
    imageUpload.uploading = false;
    imageUpload.imageFile = Xfile as File;
    imageUpload.imageUrl = '';
    images.replaceRange(index, index + 1, [imageUpload]);
  });
 });
 }
 }

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
 File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}