import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Function to create a new document in Firestore.
///
/// [colName] - The name of the Firestore collection.
/// [docName] - The document ID to be created.
/// [name] - Name field value.
/// [animal] - Animal field value.
/// [age] - Age field value (integer).
///
/// Logs a message when the document is successfully created.
Future<void> create(String colName, String docName, String name, String animal, int age) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).set({
    'name': name,
    'animal': animal,
    'age': age,
  });
  debugPrint('Database created');
}

/// Function to update a specific field in an existing Firestore document.
///
/// [colName] - The Firestore collection name.
/// [docName] - The document ID to be updated.
/// [field] - The field name to be updated.
/// [newFieldValue] - The new value for the specified field.
///
/// Logs a message when the document is successfully updated.
Future<void> update(String colName, String docName, String field, var newFieldValue) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .update({field: newFieldValue});
  debugPrint('Database updated');
}

/// Function to delete a document from Firestore.
///
/// [colName] - The Firestore collection name.
/// [docName] - The document ID to be deleted.
///
/// Logs a message when the document is successfully deleted.
Future<void> delete(String colName, String docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  debugPrint('Database deleted');
}
