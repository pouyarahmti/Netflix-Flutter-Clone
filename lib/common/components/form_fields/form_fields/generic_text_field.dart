import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../services/theme_service.dart';

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    super.key,
    this.placeholder,
    required this.validator,
    this.label = "",
    required this.type,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    required this.controller,
    this.formatters,
    this.disabled = false,
    this.isSecret = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.allCaps = false,
    this.isConfirmPasswordField = false,
    this.isPasswordMatch = false,
    this.suffixIcon,
  });

  final String? placeholder;
  final String? Function(dynamic value) validator;
  final String label;
  final TextInputType type;
  final bool disabled;
  final bool isSecret;
  final bool allCaps;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool isConfirmPasswordField;
  final bool isPasswordMatch;
  final Widget? suffixIcon;
  final int maxLines;
  final int? maxLength;
  final Function? onChanged;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  late bool _hideText;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _hideText = widget.isSecret;
  }

  void _toggleVisibility() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  Widget? _renderSuffixIcon() {
    if (widget.isSecret && !widget.isConfirmPasswordField) {
      return IconButton(
        icon: Icon(_hideText ? Icons.visibility : Icons.visibility_off),
        color: ThemeService().currentTheme.gray,
        splashColor: Theme.of(context).colorScheme.primary,
        onPressed: _toggleVisibility,
      );
    } else if (widget.isSecret && widget.isConfirmPasswordField) {
      if (widget.isPasswordMatch) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check, color: Colors.green),
            IconButton(
              icon: Icon(_hideText ? Icons.visibility : Icons.visibility_off),
              color: ThemeService().currentTheme.gray,
              splashColor: Theme.of(context).colorScheme.primary,
              onPressed: _toggleVisibility,
            ),
          ],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.red),
            IconButton(
              icon: Icon(_hideText ? Icons.visibility : Icons.visibility_off),
              color: ThemeService().currentTheme.gray,
              splashColor: Theme.of(context).colorScheme.primary,
              onPressed: _toggleVisibility,
            ),
          ],
        );
      }
    } else {
      return widget.suffixIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TEXT FIELD

        Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
          child: TextFormField(
            controller: widget.controller,
            autocorrect: widget.autocorrect,
            maxLines: widget.maxLines,
            cursorColor: ThemeService().currentTheme.secondary,
            // Set the errorText value here
            validator: (value) {
              setState(() {
                _errorText = widget.validator(value);
              });
              return _errorText;
            },
            onTapOutside: (_) {
              FocusScope.of(context).requestFocus(
                FocusNode(),
              );
            },
            maxLength: widget.maxLength,
            enabled: !widget.disabled,
            inputFormatters: widget.formatters,
            obscureText: _hideText,
            keyboardType: widget.type,
            style: const TextStyle(
              color: Colors.white,
            ),
            enableSuggestions: widget.enableSuggestions,
            textInputAction: TextInputAction.done,
            enableInteractiveSelection: true,
            textCapitalization: widget.allCaps
                ? TextCapitalization.characters
                : TextCapitalization.none,
            onChanged: (value) {
              widget.onChanged != null ? widget.onChanged!(value) : null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff2C2C2E),
              labelText: widget.label,
              hintText: widget.placeholder,
              alignLabelWithHint: true,

              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              // Hide Error Text
              errorStyle: TextStyle(
                height: -1,
                fontSize: 0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              suffixIcon: _renderSuffixIcon(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff2C2C2E),
                  width: 0.7,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff2C2C2E),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff2C2C2E),
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff2C2C2E),
                  width: 1.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: ThemeService().currentTheme.gray,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        if (_errorText != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                _errorText!,
                style: ThemeService().currentTheme.textDefault.copyWith(
                      color: ThemeService().currentTheme.danger,
                    ),
              ),
            ],
          ),
      ],
    );
  }
}
