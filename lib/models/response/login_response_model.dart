
import 'dart:convert';

class LoginRequestModel{
  String? productName;
  String? cost;
  String? location;
  String phoneNumber;
  String? adharNumbeer;


  LoginRequestModel(
      {this.productName,
      this.cost,
      this.location,
      this.adharNumbeer,
      required this.phoneNumber});

  factory LoginRequestModel.fromJson(dynamic map) {
    return LoginRequestModel(
        phoneNumber: map['phoneNumber'],
        productName: map['productName'],
        cost: map['cost'],
        location: map['location'],
        adharNumbeer: map['adharNumber']);
  }

}
