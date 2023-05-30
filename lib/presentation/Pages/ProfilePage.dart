import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deliveat/bloc/auth_bloc/auth_event.dart';
import 'package:deliveat/presentation/Pages/Auth/login/login_screen.dart';
import 'package:deliveat/utils/Authentication.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
final Authentication _authService = Authentication();

class _ProfilePageState extends State<ProfilePage> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C33),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 60,
                    // backgroundImage: user?.imageUrl as ImageProvider,
                  ),
                ),
                Text(
                  currentUser != null ? '${currentUser?.email}' : 'Null',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 100,
            width: double.infinity,
            // color: Colors.blue,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Icon(
                      Icons.ac_unit_outlined,
                      size: 30,
                    )),
                Text(
                  'Appereance',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 100,
            width: double.infinity,
            // color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Icon(
                    Icons.accessibility_new,
                    size: 30,
                  ),
                ),
                Text(
                  'Order',
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

              },
              child: const Text('Log out'),
            ),
          )
        ],
      ),
    );
  }
}
