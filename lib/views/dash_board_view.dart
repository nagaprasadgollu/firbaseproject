
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uiux/view_models/dashboard_view_model.dart';
import 'package:uiux/views/fetch.dart';

class DashBoardView extends StackedView<DashBoardModel> {
  DashBoardView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, DashBoardModel viewModel, Widget? child) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBopard"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text('Login as ${user?.email.toString()}'),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Logout"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: viewModel.productNmaeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "ProductName"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: viewModel.productCostController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Productcost"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: viewModel.productLocationController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Productlocation"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: viewModel.productPhoneNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Productphonenumber"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: viewModel.productAdhaReNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Productadhar"),
                ),
                SizedBox(
                  height: 10,
                ),

                TextButton(
                    onPressed: () {
                      viewModel.uploadingData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => Fetch())
                      );


                      // viewModel.uploadingData(viewModel.productNmaeController.text,
                      //     viewModel.productPriceController.text,
                      //     );
                      // print('${viewModel.productPriceController.text}${viewModel.productPriceController.text}');
                    },
                    child: Text("firestore"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  DashBoardModel viewModelBuilder(BuildContext context) {
    return DashBoardModel();
  }
}
