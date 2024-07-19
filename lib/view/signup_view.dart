import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:signup_provider_app/core/app_keys.dart';
import 'package:signup_provider_app/core/icons.dart';

import '../provider/signup_provider.dart';

part '../widgets/custom_signup_button.dart';
part '../widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppKeys.signUpTitle, style: AppKeys.titleTextStyle),
        ),
        body: SingleChildScrollView(
          child: Consumer<SignUpProvider>(
            builder: (context, formProvider, child) {
              return Column(
                children: [
                  _CustomTextField(
                    controller: formProvider.nameController,
                    hintText: AppKeys.nameTitle,
                    prefixIcon: personIcon,
                    errorText: formProvider.nameError ? AppKeys.errorTitle : null,
                  ),
                  _CustomTextField(
                    controller: formProvider.emailController,
                    hintText: AppKeys.emailTitle,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: emailIcon,
                    errorText: formProvider.emailError
                        ? AppKeys.errorTitle
                        : (formProvider.emailFormatError ? AppKeys.emailValidateError : null),
                  ),
                  _CustomTextField(
                    controller: formProvider.phoneController,
                    hintText: AppKeys.phoneTitle,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    prefixIcon: const Icon(Icons.phone),
                    keyboardType: TextInputType.number,
                    errorText: formProvider.phoneError ? AppKeys.errorTitle : null,
                  ),
                  _CustomTextField(
                    controller: formProvider.passwordController,
                    onPressed: formProvider.toggleObscure,
                    hintText: AppKeys.passwordTitle,
                    obsocureText: formProvider.isObscure,
                    prefixIcon: passwordIcon,
                    errorText: formProvider.passwordError ? AppKeys.errorTitle : null,
                  ),
                  _CustomTextField(
                    controller: formProvider.confirmPasswordController,
                    hintText: AppKeys.confirmPasswordTitle,
                    obsocureText: formProvider.isObscure,
                    prefixIcon: passwordIcon,
                    errorText: formProvider.confirmPasswordError
                        ? AppKeys.errorTitle
                        : (formProvider.passwordController.text.isEmpty &&
                                formProvider.confirmPasswordController.text.isNotEmpty
                            ? null
                            : (formProvider.passwordMatchError ? AppKeys.passwordMatchErrorTitle : null)),
                  ),
                  _CustomSignUpButton(provider: formProvider)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
