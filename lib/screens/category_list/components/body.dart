import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_house/database/db_helper.dart';

import '../../../model/category.dart';
import '../../../routes/app_route.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Category> categoryList = [];

  DBHelper _dbHelper = DBHelper();
  @override
  void initState() {
    super.initState();

    // categoryList.add(
    //   Category(
    //       title: 'Book',
    //       description: "Mybook",
    //       imagePath:
    //           '/data/user/0/com.example.shop_house/files/1688878379606.svg'),
    // );

    loadCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.file(
                File("${categoryList[index].imagePath}"),
                height: 30,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              backgroundColor: Colors.indigo.shade100,
            ),
            title: Text('${categoryList[index].title}'),
            subtitle: Text('${categoryList[index].description}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Category category =
              await Navigator.pushNamed(context, AppRoute.categoryScreen) as Category;

          setState(() {
            categoryList.add(category!);
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> loadCategoryList() async {
    var tempList = await _dbHelper.read();
    setState(() {
      categoryList.addAll(tempList);
    });
  }

  // void navigateToCategory() {
  //   Navigator.pushNamed(context, AppRoute.categoryScreen);
  // }
}
