import 'package:flutter/material.dart';
import 'generic_text_field.dart';

class StringFormField extends StatelessWidget {
  const StringFormField({
    super.key,
    this.placeholder = '',
    this.label = "",
    required this.onSubmit,
    this.onChange,
    this.disabled = false,
    this.suffixIcon,
    required this.controller,
    this.type,
    this.maxLines,
  });

  final String placeholder;
  final String label;
  final bool disabled;
  final Function onSubmit;
  final Function? onChange;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return GenericTextField(
      label: label,
      disabled: disabled,
      controller: controller,
      type: type ?? TextInputType.text,
      onChanged: onChange,
      placeholder: placeholder,
      suffixIcon: suffixIcon,
      maxLines: maxLines ?? 1,
      validator: (value) {
        value = value.trim();
        return onSubmit(value);
      },
    );
  }
}
