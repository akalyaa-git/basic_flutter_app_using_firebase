import 'package:basic_flutter_app_using_firebase/firebase/presentation/database_options.dart';
import 'package:basic_flutter_app_using_firebase/firebase/presentation/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// The entry point of the Flutter application.
void main() async {
  /// Ensures Flutter binding is initialized before running Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializes Firebase before the app starts.
  await Firebase.initializeApp();

  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),

      /// Listens to Firebase authentication state changes.
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          /// If the user is authenticated, navigate to database options.
          if (snapshot.hasData) {
            return const DataBaseOptions();
          } else {
            /// If not authenticated, show the login/signup screen.
            return const FirebaseAuthentication();
          }
        },
      ),
    );
  }
}
