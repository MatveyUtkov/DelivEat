import 'package:deliveat/theme/CustomTheme.dart';
import 'package:deliveat/theme/ThemeNotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deliveat/bloc/auth_bloc/auth_event.dart';
import 'package:deliveat/presentation/Pages/Auth/login/login_screen.dart';
import 'package:deliveat/utils/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
final Authentication _authService = Authentication();

class _ProfilePageState extends State<ProfilePage> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  late ThemeData _currentTheme;
  @override
  Widget build(BuildContext context) {
         return Consumer<ThemeNotifier>(
           builder: (context,ThemeNotifier themeNotifier,child){
             
             return Scaffold(
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
                             radius: 30,
                             // backgroundImage: user?.imageUrl as ImageProvider,
                           ),
                         ),
                         Text(
                           currentUser != null ? '${currentUser?.email}' : 'Null',
                           style: const TextStyle(
                             fontSize: 24,
                           ),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 100,
                   ),
                   ElevatedButton(
                       onPressed: () async {
                     themeNotifier.setTheme(CustomTheme.lightTheme);
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                     await prefs.setString('theme', 'light');

                       },
                    child: Text('Switch to Light theme')
                   ),
                   ElevatedButton(
                       onPressed: () async {
                         themeNotifier.setTheme(CustomTheme.darkTheme);
                         SharedPreferences prefs = await SharedPreferences.getInstance();
                         await prefs.setString('theme', 'dark');
                       },
                       child: Text('Switch to Dark theme')
                   ),
                   ElevatedButton(
                       onPressed: () async {
                         themeNotifier.setTheme(CustomTheme.customTheme);
                         SharedPreferences prefs = await SharedPreferences.getInstance();
                         await prefs.setString('theme', 'custom');

                       },
                       child: Text('Switch to Custom theme')
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
                             padding: EdgeInsetsDirectional.fromSTEB(
                                 10, 10, 10, 10),
                             child: Icon(
                               Icons.ac_unit_outlined,
                               size: 30,
                             )),
                         Text(
                           'Appereance',
                           style: TextStyle(
                             fontSize: 30,
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
         );
        }
  }

