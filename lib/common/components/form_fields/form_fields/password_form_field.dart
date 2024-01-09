import 'package:flutter/material.dart';
import './generic_text_field.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.onSubmit,
    this.label = "Password",
    this.placeholder = "Enter password",
    this.isConfirmPasswordField = false,
    this.isPasswordMatch = false,
    required this.controller,
    this.disabled = false,
    this.onChanged,
  });

  final Function onSubmit;
  final String label;
  final bool isConfirmPasswordField;
  final String placeholder;
  final bool isPasswordMatch;
  final TextEditingController controller;
  final Function? onChanged;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GenericTextField(
      type: TextInputType.text,
      label: label,
      autocorrect: false,
      controller: controller,
      enableSuggestions: false,
      disabled: disabled,
      placeholder: placeholder,
      isConfirmPasswordField: isConfirmPasswordField,
      onChanged: onChanged,
      isPasswordMatch: isPasswordMatch,
      isSecret: true,
      validator: (value) {
        value = value.trim();
        return onSubmit(value);
      },
    );
  }
}
