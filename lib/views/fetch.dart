import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uiux/models/response/login_response_model.dart';

class Fetch extends StatefulWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  List<LoginRequestModel> products = [];

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var records = await FirebaseFirestore.instance.collection("products").get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
  var list=  records.docs.map((login) =>
        LoginRequestModel(
            phoneNumber: login['phoneNumber'],
          productName: login['productName'],
        )).toList();
  setState(() {
    products=list;
  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
title: Text(products[index].phoneNumber),
              subtitle: Text(products[index].productName ?? ''),
            );
          }
      ),

    );
  }
}
