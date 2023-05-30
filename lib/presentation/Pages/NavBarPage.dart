import 'package:firebase_auth/firebase_auth.dart';
import 'package:deliveat/presentation/Pages/CartPage.dart';
import 'package:deliveat/presentation/Pages/MapPage.dart';
import 'package:deliveat/presentation/Pages//HomePage.dart';
import 'package:deliveat/presentation/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required User user}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final deepBlue = const Color(0xFF678094);
  final backBottNavBar = const Color(0xFFfa8b9b);
  final backScreenColor = Colors.black;

  int index = 0;

  final screenList=[
    HomePage(user:FirebaseAuth.instance.currentUser),
    const CartPage(),
    const MapPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screenList[index],
      backgroundColor: backScreenColor,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor:const Color(0xFFfa8b9b),
          backgroundColor: backBottNavBar,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Icon(
                FontAwesomeIcons.bellConcierge,
                color: backScreenColor,
                size: 30,
              ),
              label: 'Restaraunts',
            ),
            NavigationDestination(
              icon: Icon(
                FontAwesomeIcons.bagShopping,
                color: backScreenColor,
                size: 30,
              ),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(
                FontAwesomeIcons.mapLocation,
                color: backScreenColor,
                size: 30,
              ),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Icon(
                FontAwesomeIcons.userCircle,
                color: backScreenColor,
                size: 30,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
