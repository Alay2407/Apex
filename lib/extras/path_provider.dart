import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
//path provider provide path for application
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Path provider', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Future<void> getPath() async {
    Directory tempDir = await getTemporaryDirectory();
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    Directory supportDir = await getApplicationSupportDirectory();
    // Directory? downloadsDir = await getDownloadsDirectory();
    print('temp directory:${tempDir.path}');
    print('appDocDir directory:${appDocumentsDir.path}');
    print('supportDir directory:${supportDir.path}');
    // print('download directory:${downloadsDir!.path}');


    //file object here created category folder
    File file = File('${supportDir.path}/category');

    //if file or folder exixts then it will not recreate but not exists then it wii create.
    if(!await file.exists()){
      file.create();
      print('file created');
    }

    print(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
            child: ElevatedButton(
                onPressed: () {
                  getPath();
                },
                child: Text('Get path storage'))),
      ),
    );
  }
}
