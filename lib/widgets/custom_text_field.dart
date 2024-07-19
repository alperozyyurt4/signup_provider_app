part of '../view/signup_view.dart';

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    super.key,
    this.errorText,
    this.obsocureText = false,
    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.hintText,
    required this.prefixIcon,
    this.inputFormatters,
    required this.controller,
  });
  final hintText;
  final bool obsocureText;
  final errorText;
  final TextInputType keyboardType;
  final VoidCallback? onPressed;
  final Icon prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.sized.mediumValue),
        Padding(
          padding: context.padding.horizontalNormal,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obsocureText,
            decoration: InputDecoration(
                errorText: errorText,
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: onPressed != null
                    ? IconButton(
                        onPressed: onPressed,
                        icon: obsocureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off))
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
        ),
        SizedBox(height: context.sized.lowValue / 100)
      ],
    );
  }
}
