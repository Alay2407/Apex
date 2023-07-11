import 'package:flutter/material.dart';
import 'package:shop_house/preferences/pref_manager.dart';
import 'package:shop_house/routes/app_route.dart';
import 'package:shop_house/screens/home/components/body.dart';
import 'package:shop_house/screens/home/components/home_screen_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: HomeScreenDrawer(),
    );
  }
}

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               PrefManager.logout();
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 AppRoute.loginScreen,
//                 (route) => false,
//               );
//             },
//             child: Text('Logout')),
//       ),
//     );
//   }
// }
