import 'package:Flutter_Boilerplate/core/internationalization/translated/translated.dart';
import 'package:Flutter_Boilerplate/features/login/presentation/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  final LoginStore loginStore;

  LoginPage({this.loginStore});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Form(
            autovalidate: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    return TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                        alignLabelWithHint: true,
                        labelText: Translated.of(context).login.loginPlaceholder
                      ),
                      onChanged: (value){
                        widget.loginStore.login = value;
                      },
                      validator: (value) {
                        return null;
                      },
                    );
                  },              
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Observer(
                    builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration( 
                          contentPadding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                          alignLabelWithHint: true,
                          labelText: Translated.of(context).login.passwordPlaceholder
                        ),
                        onChanged: (value){
                          widget.loginStore.password = value;
                        },
                        validator: (value) {
                          return null;
                        },
                      );
                    },
                  ),
                ),
                FlatButton(
                  child: Text(Translated.of(context).login.loginButton),
                  onPressed: () => widget.loginStore.autenticate(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}