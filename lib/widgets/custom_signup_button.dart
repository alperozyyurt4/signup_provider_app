part of '../view/signup_view.dart';

class _CustomSignUpButton extends StatelessWidget {
  const _CustomSignUpButton({
    required this.provider,
  });
  final SignUpProvider provider;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (provider.isValidForm()) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(AppKeys.succesRegister),
                  content: const Text(AppKeys.registerCreated),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Dialogu kapatır
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text('Sign Up'));
  }
}
