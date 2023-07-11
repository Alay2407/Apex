import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_house/database/db_helper.dart';
import 'package:shop_house/model/category.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DBHelper dbHelper = DBHelper();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  File? imageFile;

  addCategory(Category category) async {
    var id = await dbHelper.insert(category);

    if (id != -1) {
      print('category added successfully');
      category.id = id;
      Navigator.pop(context, category);
    } else {
      print("getting error while adding category");
    }
  }

  pickImageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        //get path
        imageFile = File(image.path);

        print('path img : $imageFile!');
      });
    }
  }

  Future<String?> saveImage(File? tempfile) async {
    try {
      var supportDir = await getApplicationSupportDirectory();

      String root = supportDir.path;

      String fileName = '${DateTime.now().millisecondsSinceEpoch}.svg';

      print(root);
      print(fileName);

      print('${root}/${fileName}');
      //here tempfile copy in new location behind ${root}/${fileName}...
      File mFile = await tempfile!.copy('${root}/${fileName}');

      if (mFile != null) {
        return mFile.path;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  //open gallery
                  pickImageFromGallery();
                },
                child: CircleAvatar(
                  // backgroundImage: imageFile != null
                  //     ? FileImage(imageFile!)
                  //     : AssetImage("assets/images/user.png") as ImageProvider,
                  child: imageFile != null
                      ? SvgPicture.file(
                          imageFile!,
                          colorFilter:
                              ColorFilter.mode(Colors.black45, BlendMode.srcIn),
                        )
                      : Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                  radius: 60,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              buildTitleFormField(),
              SizedBox(
                height: 16,
              ),
              buildDescriptionFormField(),
              SizedBox(
                height: 24,
              ),
              buildAddCategoryButtonWidget(),
              SizedBox(
                height: 24,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     //using this get file from database and set.
              //     //we have given file path here
              //     File tempFile = File(
              //         '/data/user/0/com.example.shop_house/files/1688795109926.jpg');
              //
              //     setState(() {
              //       //at the begining imageFile is empty and then we add tempFile into imageFile.
              //       imageFile = tempFile;
              //     });
              //   },
              //   child: Text('Get file from internal storage'),
              // )
            ],
          ),
        ),
      ),
    );
  }

  buildTitleFormField() {
    return TextFormField(
      controller: _titleController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Category',
        hintText: 'Category Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildDescriptionFormField() {
    return TextFormField(
      controller: _descController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'Description Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildAddCategoryButtonWidget() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      onPressed: () async {
        String title = _titleController.text.toString().trim();
        String desc = _descController.text.toString().trim();

        if (imageFile == null) {
          print('please select img first');
        } else if (title.isEmpty) {
          print('please enter category name');
        } else if (desc.isEmpty) {
          print('please enter category description');
        } else {
          //save image to galary or internal storage or get path of that file
          //here pass imagefile because here data in image file
          String? path = await saveImage(imageFile);

          if (path != null) {
            // print('title: $title and desc: $desc  imagePath:$path');

            // save this data to sqllite database.
            //we cannot access these data from another application
            // but we can access using this application.

            Category category =
                Category(title: title, description: desc, imagePath: path);
            addCategory(category);
          }
        }
      },
      child: Text(
        'Add category',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
