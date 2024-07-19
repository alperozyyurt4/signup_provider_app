import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _nameError = false;
  bool _emailError = false;
  bool _emailFormatError = false;
  bool _phoneError = false;
  bool _passwordError = false;
  bool _confirmPasswordError = false;
  bool _passwordMatchError = false;
  bool _isObscure = true;

  bool get nameError => _nameError;
  bool get emailError => _emailError;
  bool get emailFormatError => _emailFormatError;
  bool get phoneError => _phoneError;
  bool get passwordError => _passwordError;
  bool get confirmPasswordError => _confirmPasswordError;
  bool get passwordMatchError => _passwordMatchError;
  bool get isObscure => _isObscure;

  void validateInputs() {
    _nameError = nameController.text.isEmpty;
    _emailError = emailController.text.isEmpty;
    _emailFormatError = !_emailError && !EmailValidator.validate(emailController.text);
    _phoneError = phoneController.text.isEmpty;
    _passwordError = passwordController.text.isEmpty;
    _confirmPasswordError = confirmPasswordController.text.isEmpty;
    _passwordMatchError = passwordController.text != confirmPasswordController.text;
    notifyListeners();
    if (_nameError ||
        _emailError ||
        _emailFormatError ||
        _phoneError ||
        _passwordError ||
        _confirmPasswordError ||
        _passwordMatchError) {
      showErrorMessage();
    }
  }

  void showErrorMessage() {
    Future.delayed(const Duration(seconds: 3), () {
      _nameError = false;
      _emailError = false;
      _phoneError = false;
      _emailFormatError = false;
      _passwordError = false;
      _confirmPasswordError = false;
      _passwordMatchError = false;
      _phoneError = false;
      notifyListeners();
    });
  }

  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  bool isValidForm() {
    validateInputs();

    return !_nameError &&
        !_emailError &&
        !_emailFormatError &&
        !_phoneError &&
        !_passwordError &&
        !_confirmPasswordError &&
        !_passwordMatchError;
  }
}
