import 'package:basic_flutter_app_using_firebase/firebase/functions/authFunctions.dart';
import 'package:flutter/material.dart';

/// A StatefulWidget to handle Firebase email/password authentication.
class FirebaseAuthentication extends StatefulWidget {
  const FirebaseAuthentication({super.key});

  @override
  State<FirebaseAuthentication> createState() => _FirebaseAuthenticationState();
}

class _FirebaseAuthenticationState extends State<FirebaseAuthentication> {
  final _formKey = GlobalKey<FormState>(); // Global key for form validation
  bool isLogin = false; // Tracks whether the user is logging in or signing up
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email/Pass Auth'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Username input field (only shown when signing up)
              !isLogin
                  ? TextFormField(
                      key: const ValueKey('username'),
                      decoration:
                          const InputDecoration(hintText: 'Enter Username'),
                      validator: (value) {
                        if (value == null || value.length < 3) {
                          return 'Username must be at least 3 characters long';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                    )
                  : Container(),

              /// Email input field
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(hintText: 'Enter Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),

              /// Password input field
              TextFormField(
                obscureText: true,
                key: const ValueKey('password'),
                decoration: const InputDecoration(hintText: 'Enter Password'),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              /// Submit button for login/signup
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      isLogin
                          ? signin(email, password) // Calls signin function
                          : signup(email, password); // Calls signup function
                    }
                  },
                  child: Text(isLogin ? 'Login' : 'Signup'),
                ),
              ),

              const SizedBox(height: 10),

              /// Toggle button to switch between login and signup
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? "Don't have an account? Signup"
                      : "Already Signed Up? Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
