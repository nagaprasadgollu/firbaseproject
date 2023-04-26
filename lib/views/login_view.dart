import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uiux/view_models/login_view_model.dart';

class LoginView extends StackedView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(children: [
        SizedBox(height: 40,),
        TextFormField(
          obscureText: false,
          controller:viewModel.emailController,
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
          onPressed: () async{
            viewModel.logiInFirebase(
                email: viewModel.emailController.text,
                password: viewModel.passwordController.text);
            print('${viewModel.passwordController.text}${viewModel.passwordController.text}');
          },
          child: const Text("login"),
        ),
        ElevatedButton(
          onPressed: ()  {
            viewModel.registration(
                email: viewModel.emailController.text,
                password: viewModel.passwordController.text);
            print('${viewModel.passwordController}${viewModel.passwordController}');
          },
          child: const Text("register"),
        )
      ]),
    ));
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) {
    return LoginViewModel();
  }
}
