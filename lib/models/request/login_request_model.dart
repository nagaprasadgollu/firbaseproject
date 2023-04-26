class LoginRequestModel {
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

  Map<String, dynamic> toJson() {
    return {
      'productsName': productName,
      'cost': cost,
      'location': location,
      'phoneNumber': phoneNumber,
      'adharnumber': adharNumbeer,
    };
  }
}
