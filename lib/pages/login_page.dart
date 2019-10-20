import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../components/text_form_item.dart';
import '../components/button_item.dart';
import '../network/api_service.dart';
import '../functions/exit_app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool tokenMode = false;
  ProgressDialog loadingDialog;
  final Map<String, dynamic> _formData = {
    'username': null,
    'password': null,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitApp(),
      child: Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: tokenMode ? _buildTokenBody() : _buildEmailBody(),
        ),
      ),
    );
  }

  Widget _buildEmailBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            type: CustomTextFormFieldType.Email,
            onSaved: (String value) {
              _formData['username'] = value;
            },
          ),
          SizedBox(height: 20.0),
          CustomTextFormField(
            type: CustomTextFormFieldType.Password,
            onSaved: (String value) {
              _formData['password'] = value;
            },
          ),
          SizedBox(height: 20.0),
          Container(
              width: screenWidth - screenWidth * .2,
              child: CustomButton(
                title: 'Sign In',
                onPressed: _submitForm,
              )),
          FlatButton(
            child: Text('Login With Token ?'),
            textColor: Colors.black,
            onPressed: () {
              setState(() {
                _formKey.currentState.reset();
                tokenMode = true;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTokenBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            type: CustomTextFormFieldType.Token,
            onSaved: (String value) {
              _formData['username'] = value;
              _formData['password'] = 'api_token';
            },
          ),
          SizedBox(height: 20.0),
          Container(
              width: screenWidth - screenWidth * .2,
              child: CustomButton(
                title: 'Sign In',
                onPressed: _submitForm,
              )),
          FlatButton(
            child: Text('Login With Email ?'),
            textColor: Colors.black,
            onPressed: () {
              setState(() {
                _formKey.currentState.reset();
                tokenMode = false;
              });
            },
          ),
        ],
      ),
    );
  }

  void _submitForm() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      loadingDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
      loadingDialog.style(message: 'Please Wait');
      loadingDialog.show();
      String status = await ApiService.instance.loginUser(_formData);
      loadingDialog.hide();
      if (status == 'ok') {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(status, style: TextStyle(color: Colors.red))));
      }
    }
  }
}
