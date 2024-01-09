import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'generic_text_field.dart';

class NumberFormField extends StatelessWidget {
  const NumberFormField({
    Key? key,
    this.disabled = false,
    required this.onSubmit,
    this.placeholder = "",
    this.label = "",
    required this.controller,
  }) : super(key: key);

  final bool disabled;
  final Function onSubmit;
  final String placeholder;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GenericTextField(
      placeholder: placeholder,
      label: label,
      type: TextInputType.number,
      controller: controller,
      disabled: disabled,
      autocorrect: false,
      enableSuggestions: false,
      validator: (value) {
        value = value.trim();
        return onSubmit(value);
      },
    );
  }
}
