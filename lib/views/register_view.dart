import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uiux/view_models/register_view_model.dart';

import 'package:uiux/views/login_view.dart';

class RegisterView extends StackedView<RegisterviewModel> {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, RegisterviewModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            TextFormField(
              controller: viewModel.emailController,
              obscureText: false,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.mail),
                  hintText: "email"),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: viewModel.passwordController,
              obscureText: false,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "password"),
            ),
            ElevatedButton(
                onPressed: () async {
                  final message = await viewModel.registeration(
                      email: viewModel.emailController.text,
                      password: viewModel.passwordController.text);
                  if (message!.contains("sucess")) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginView()));
                  } else {
                    Text("register account");
                  }
                },
                child: Text("register"))
          ]),
        ),
      ),
    );
  }

  @override
  RegisterviewModel viewModelBuilder(BuildContext context) {
    return RegisterviewModel();
  }
}
