import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// A StatefulWidget that retrieves and displays data from Firestore in real-time.
class RetrieveData extends StatefulWidget {
  const RetrieveData({super.key});

  @override
  State<RetrieveData> createState() => _RetrieveDataState();
}

class _RetrieveDataState extends State<RetrieveData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieved Data'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),

        /// StreamBuilder listens for real-time updates from Firestore.
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('pets').snapshots(),
          builder: (context, snapshot) {
            /// Show a loading spinner while waiting for data.
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            /// If snapshot has data, extract documents.
            if (snapshot.hasData) {
              final petDocs = snapshot.data!.docs;

              /// Display data in a ListView.
              return ListView.builder(
                itemCount: petDocs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      title: Text(petDocs[index]['name']), // Display pet name
                      subtitle:
                          Text(petDocs[index]['animal']), // Display pet type
                    ),
                  );
                },
              );
            }

            /// Show a message if no data is found.
            return const Center(
              child: Text('No data available'),
            );
          },
        ),
      ),
    );
  }
}
