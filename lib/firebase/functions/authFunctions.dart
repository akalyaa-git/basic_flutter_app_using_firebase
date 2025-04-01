import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Function to sign up a new user with email and password.
/// Utilizes Firebase Authentication to create an account.
///
/// [email] - The email address of the new user.
/// [password] - The password for the new user.
///
/// Displays debug messages on success or failure.
Future<void> signup(String email, String password) async {
  try {
    final credential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    debugPrint('SUCCESS'); // Sign-up successful
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
  } catch (e) {
    debugPrint(e as String?); // Catch any other errors
  }
}

/// Function to sign in an existing user using email and password.
/// Uses Firebase Authentication for user login.
///
/// [email] - The email address of the user.
/// [password] - The password associated with the user account.
///
/// Prints debug messages based on the authentication status.
Future<void> signin(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    debugPrint('SUCCESS Login'); // Login successful
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      debugPrint('Wrong password provided for that user.');
    }
  }
}
