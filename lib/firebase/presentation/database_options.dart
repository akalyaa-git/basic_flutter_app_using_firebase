import 'package:basic_flutter_app_using_firebase/firebase/functions/database_functions.dart';
import 'package:basic_flutter_app_using_firebase/firebase/presentation/retrieve_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A StatefulWidget providing UI options for performing Firestore database operations.
class DataBaseOptions extends StatefulWidget {
  const DataBaseOptions({Key? key}) : super(key: key);

  @override
  _DataBaseOptionsState createState() => _DataBaseOptionsState();
}

class _DataBaseOptionsState extends State<DataBaseOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Options'),
        actions: [
          /// Logout button to sign out the user from Firebase Authentication.
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut(); // Signs out the user
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Button to create a new document in Firestore.
            ElevatedButton(
              onPressed: () {
                create(
                  'pets', // Collection name
                  'kitty', // Document ID
                  'jerry', // Name field
                  'cat', // Animal field
                  5, // Age field
                );
              },
              child: const Text('Create'),
            ),

            /// Button to update an existing document's field in Firestore.
            ElevatedButton(
              onPressed: () {
                update(
                  'pets', // Collection name
                  'tom', // Document ID
                  'age', // Field name to update
                  14, // New value
                );
              },
              child: const Text('Update'),
            ),

            /// Button to navigate to the RetrieveData screen to fetch data from Firestore.
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RetrieveData(),
                  ),
                );
              },
              child: const Text('Retrieve'),
            ),

            /// Button to delete a specific document from Firestore.
            ElevatedButton(
              onPressed: () {
                delete('pets',
                    'kitty'); // Deletes the document with ID 'kitty' from 'pets' collection.
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
