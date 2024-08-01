import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:tp_twitter/app-theme.dart';
import 'package:tp_twitter/auth/viewmodels/auth-viewmodel.dart';
import 'package:tp_twitter/helper/app-lang-dialog.dart';
import 'package:tp_twitter/helper/app-validators.dart';

class LoginPage extends StatelessWidget {
  final viewModel = AuthViewModel();

  var emailController = TextEditingController(text: 'isaac@gmail.com');
  var passwordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  /// At submit call api from view model
  void onSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      viewModel.callApi(context, emailController.text, passwordController.text);
    }
  }

  /// Show switch lang form on a dialog
  void showLangDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppLangDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("title-login".i18n()),
          actions: [
            IconButton(
                onPressed: () => showLangDialog(context),
                icon: const Icon(Icons.language))
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "images/background_01.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/sign_in_icon.png",
                      color: Colors.white,
                      width: 124,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'title-login'.i18n(),
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ),
                    AppTheme.wrapFormPadding(TextFormField(
                      controller: emailController,
                      validator: AppValidator.validateEmail,
                      decoration:
                          InputDecoration(labelText: "hint-email".i18n()),
                    )),
                    AppTheme.wrapFormPadding(TextFormField(
                      controller: passwordController,
                      validator: AppValidator.validatePassword,
                      decoration:
                          InputDecoration(labelText: "hint-password".i18n()),
                      obscureText: true,
                    )),
                    AppTheme.wrapFormPadding(Row(
                      children: [
                        Switch(value: false, onChanged: (value) {}),
                        Text(
                          "label-remember_information".i18n(),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => onSubmit(context),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("button-login".i18n()),
                            )))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
