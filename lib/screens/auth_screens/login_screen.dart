import 'package:fl_structure/utils/all_colors.dart';
import 'package:fl_structure/utils/assets_paths.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                color: AllColors.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.6),
                  bottomRight: Radius.circular(screenWidth * 0.6),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: screenWidth * 0.40,
                height: screenWidth * 0.40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(screenWidth * 0.35),
                ),
                child: CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: AssetImage(AssetsPath.logo) ,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.25,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Secure Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: screenWidth * 0.06,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextButton(
                    onPressed: () {
                      // Add forgot password functionality
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'If you have not an Account? Register Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Register New School',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            right: screenWidth * 0.05,
            child: FloatingActionButton(
              onPressed: () {
                // Add functionality for the FloatingActionButton
              },
              child: Icon(Icons.message),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Use the username and password variables as needed
      print('Username: $_username');
      print('Password: $_password');
    }
  }
}
