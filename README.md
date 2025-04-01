## Getting Started

## Flutter Firebase App

This is a Flutter application that integrates Firebase Authentication and Firestore database operations. The app provides user authentication via email and password, along with CRUD operations on a Firestore collection.

# Features

* Firebase Authentication: Sign up and login using email and password.

* Firestore Integration: Create, read, update, and delete (CRUD) documents in the Firestore database.

* State Management: Authentication state is managed using StreamBuilder to track user sessions.

* User Navigation: Authenticated users are redirected to database operations, while unauthenticated users see the login/signup screen.

# Installation
* Clone the Repository:
git clone https://github.com/your-repository/flutter-firebase-app.git
cd flutter-firebase-app

# Install Dependencies:

flutter pub get

# Set Up Firebase:

* Create a Firebase project at Firebase Console.

* Add Firebase to your Flutter app and download the google-services.json (for Android) or GoogleService-Info.plist (for iOS).

* Place the configuration file in the appropriate location:

android/app/ for Android.

ios/Runner/ for iOS.

* Enable Firestore and Authentication in Firebase settings.

# Dependencies

* firebase_core: Initializes Firebase

* firebase_auth: Handles authentication

* cloud_firestore: Manages Firestore database