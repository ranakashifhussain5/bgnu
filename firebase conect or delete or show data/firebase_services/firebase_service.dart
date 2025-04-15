
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class firebaseServices {
  Future<void> add(String email, String name, String degree) async {
    await firebaseFirestore
        .collection('user')
        .add({'email': email, 'degree': degree, 'name': name})
        .catchError((e) {
          print(e.toString());
        })
        .whenComplete(() => print('Data added'));
  }

  Future<void> delete(String id, BuildContext context) async {
    await firebaseFirestore.collection('user').doc(id).delete().then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User deleted successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user: $error')),
      );
    });
  }


  Future<void> updata(
    String id,
    String name,
    String email,
    String degree,
  ) async {
    await firebaseFirestore.collection('user').doc(id).update({
      'name': name,
      'email': email,
      'degree': degree,
    });
  }
}
