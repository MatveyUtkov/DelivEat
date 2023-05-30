import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_import
// ignore: unused_import
import 'package:deliveat/presentation/Pages/HomePage.dart';

// ignore: unused_import
import 'package:deliveat/presentation/Pages/CartPage.dart';
import 'package:deliveat/presentation/Pages/Auth/login/login_screen.dart';
import 'package:deliveat/presentation/Pages/NavBarPage.dart';
// import 'package:food_app/presentation/Pages/AuthPage.dart';

// ignore: unused_import
import 'package:deliveat/presentation/SplashScreen/SplashScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_event.dart';
import 'bloc/auth_bloc/auth_state.dart';
import 'bloc/bloc_observer.dart';
import 'bloc/repositories/user_repository.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(
        userRepository: userRepository,
      )..add(AuthStarted()),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);
class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  const MyApp({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthFailure) {
            return LoginScreen(
              userRepository: _userRepository,
            );
          }

          if (state is AuthSuccess) {
            return NavBar(
              user: state.firebaseUser,
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("Error"),
            ),
          );
        },
      ),
    );
  }
}