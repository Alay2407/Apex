import 'package:flutter/material.dart';
import 'package:shop_house/screens/category/components/body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Body(),
    );
  }
}
