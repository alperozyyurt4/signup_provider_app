import 'package:flutter/material.dart';

class AppKeys {
  AppKeys._();

  /// Text Style

  static const titleTextStyle = TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24);

  /// error strings

  static const errorTitle = 'This field cannot be empty';
  static const passwordMatchErrorTitle = 'Passwords do not match';
  static const emailErrorTitle = 'Please enter your email address';
  static const emailValidateError = 'Please enter a valid email address';

  /// strings

  static const signUpTitle = 'Sign Up';

  static const nameTitle = 'Name';
  static const emailTitle = 'Email';
  static const passwordTitle = 'Password';
  static const confirmPasswordTitle = 'Confirm Password';
  static const phoneTitle = 'Phone';

  /// Alert dialog stings
  static const succesRegister = 'Registration Successful';
  static const registerCreated = 'Your account has been created successfully.';
}
