
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uiux/models/request/login_request_model.dart';

class DashBoardModel extends ChangeNotifier {
  TextEditingController productNmaeController = TextEditingController();
  TextEditingController productCostController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController productPhoneNumberController = TextEditingController();
  TextEditingController productAdhaReNumberController = TextEditingController();

  //late LoginRequestModel loginRequestModel;
  Future<void> uploadingData() async {
    LoginRequestModel loginRequestModel = LoginRequestModel(
      //parameters     //values
        productName: productNmaeController.text,
        cost: productCostController.text,
        location: productLocationController.text,
        phoneNumber: productPhoneNumberController.text,
        adharNumbeer: productAdhaReNumberController.text);
    await FirebaseFirestore.instance
        .collection("products")
        .add(loginRequestModel.toJson());
  }
}




