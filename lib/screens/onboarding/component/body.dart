import 'package:flutter/material.dart';
import 'package:shop_house/preferences/pref_manager.dart';
import 'package:shop_house/routes/app_route.dart';
import 'package:shop_house/screens/onboarding/component/indicator.dart';
import 'package:shop_house/screens/onboarding/component/slide_view.dart';

import '../../../model/item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> itemList = [];

  int currentIndex = 0;
  final _pageController = PageController();
  @override
  void initState() {
    itemList.add(Item(
      title: 'Select Item',
      dese:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Except',
      image: 'assets/images/user.png',
    ));
    itemList.add(Item(
      title: 'Purchase',
      dese:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Except',
      image: 'assets/images/user.png',
    ));
    itemList.add(Item(
      title: 'Delivery',
      dese:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Except',
      image: 'assets/images/user.png',
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return SlideView(itemList[index]);
          },
        ),
        bottomSheet:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              for (int i = 0; i < itemList.length; i++)
                if (i == currentIndex)
                  getIndicator(true)
                else
                  getIndicator(false)
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (currentIndex == itemList.length - 1) {
                //navigate to login page

                PrefManager.updateOnboardingStatus(true);
                Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
              } else {
                currentIndex++;
                _pageController.animateToPage(currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              }
            },
            child: Text(
              currentIndex == itemList.length - 1 ? 'Finish' : 'Next',
            ),
          ),
        ]),
      ),
    );
  }
}
