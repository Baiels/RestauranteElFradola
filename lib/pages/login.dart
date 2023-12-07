import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String? _usuario, _senha;

  void _submit() {
    final form = formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        _performLogin();
      }
    }
  }

  void _performLogin() {
    Navigator.pushReplacementNamed(context, '/pedidos');
  }

  @override
  Widget build(BuildContext context) {
    var loginBtn = new MaterialButton(
      onPressed: _submit,
      height: 40.0,
      minWidth: double.infinity,
      color: Colors.blue,
      textColor: Colors.white,
      child: new Text("ENTRAR"),
    );

    var loginForm = ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 0, 149, 255),
              width: double.infinity,
              height: 270.0,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/logo.png')),
            ),
            Divider(
              height: 1.0,
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (val) => _usuario = val,
                        validator: (val) {
                          return val == null ? "Digite seu usuário" : null;
                        },
                        decoration: new InputDecoration(labelText: "Usuário"),
                      ),
                      Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                      TextFormField(
                        onSaved: (val) => _senha = val,
                        validator: (val) {
                          return val == null ? "Digite sua senha" : null;
                        },
                        obscureText: true,
                        decoration: new InputDecoration(labelText: "Senha"),
                      ),
                      new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
                      _isLoading ? new CircularProgressIndicator() : loginBtn
                    ],
                  )),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      body: loginForm,
    );
  }
}
