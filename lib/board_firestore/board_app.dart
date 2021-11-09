import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class BoardApp extends StatefulWidget {
  const BoardApp({Key? key}) : super(key: key);

  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  var firestoreDb = FirebaseFirestore.instance.collection("board").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("community board"),
      ),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, int index){
              return Text(snapshot.data!.docs[index]['title']);

          });
        }),
    );
  }
}
