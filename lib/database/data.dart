import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynotes/constants/lists.dart';
import 'package:mynotes/constants/strings.dart';
import 'package:provider/provider.dart';

class Data {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference opportunities =
      FirebaseFirestore.instance.collection("opportunity");
  String? uid;
  Data({this.uid});

  Future<void> createData(
    String username,
    String email,
    String password,
    String status,
  ) async {
    return userCollection.doc(uid).set({
      "username": username,
      "email": email,
      "password": password,
      "status": status,
      "stature": "",
      "bio": "",
      "poc_name": "",
      "poc_contact": "",
    });
  }

  Future<void> editDataNgo(
    String username,
    String stature,
    String pocName,
    String pocContact,
  ) async {
    return userCollection.doc(uid).update({
      "username": username,
      "stature": stature,
      "poc_name": pocName,
      "poc_contact": pocContact,
    });
  }

  Future<void> createEditData(
    String stature,
    String bio,
    String username,
  ) {
    return userCollection.doc(uid).update({
      "stature": stature,
      "bio": bio,
      "username": username,
    });
  }

  Future getUserList() async {
    try {
      await userCollection.get().then(
        (querySnapshot) {
          // ignore: avoid_function_literals_in_foreach_calls
          querySnapshot.docs.forEach(
            (element) {
              if (element.id == uid) {
                userData = [];
                userData.add(element.data());
              }
            },
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  Future<void> opportunityData(List itemsData) async {
    return opportunities.doc(uid).set({"itemsData": itemsData});
  }

  Future getOpportunityData() async {
    try {
      await opportunities.get().then(
        (querySnapshot) {
          // ignore: avoid_function_literals_in_foreach_calls
          querySnapshot.docs.forEach(
            (element) {
              if (element.id == uid) {
                userData = [];
                userData.add(element.data());
              }
            },
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
