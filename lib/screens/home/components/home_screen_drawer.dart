import 'package:flutter/material.dart';
import 'package:shop_house/preferences/pref_manager.dart';
import 'package:shop_house/routes/app_route.dart';
import 'package:shop_house/screens/category_list/category_list_screen.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        buildUserAccountHeader(),
        ListTile(
          leading: Icon(Icons.add),
          title: Text(
            'Manage Category',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, AppRoute.categoryListScreen);
          },
        ),
        ListTile(
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ]),
    );
  }

  buildUserAccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(PrefManager.getLoginName()),
      accountEmail: Text(PrefManager.getLoginEmail()),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(
          .40,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
    );
  }
}
