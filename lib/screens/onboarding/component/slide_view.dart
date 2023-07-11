import 'package:flutter/material.dart';

import '../../../model/item.dart';

class SlideView extends StatelessWidget {
  Item item;
  SlideView(this.item);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 17,
            child: Image.asset(item.image),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            item.dese,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
