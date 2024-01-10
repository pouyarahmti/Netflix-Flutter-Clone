import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb_clone/common/services/url_launcher_service.dart';

import '../../common/components/buttons/fill_button.dart';

import '../../common/components/form_fields/form_fields/string_form_field.dart';
import '../../common/services/dialog_service.dart';
import '../../common/services/logger_service.dart';
import '../../common/services/theme_service.dart';
import '../../common/services/toast_service.dart';
import '../../common/utils/utils_manager.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _formData;

  bool _isLoading = false;

  // TEXT EDITING CONTROLLERS
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  @override
  void initState() {
    initFormData();
    super.initState();
  }

  void initFormData() {
    _formData = {
      "email": _emailTextEditingController.text,
    };
  }

  void login() async {
    if (!_formKey.currentState!.validate()) {
      LoggerService().warning(
          title: "FORGET PASSWORD FORM - INVALID FORM",
          message: json.encode(_formData));
      // ToastService().error(context, "FORM INVALID");
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        await Future.delayed(const Duration(seconds: 2));
        DialogsService().showAlertDialog(
          context: context,
          title: "Check your email",
          message:
              "We've sent you an email with a link to reset your password. Please check your email.",
          buttonText: "Go to mail",
          onPressed: () {
            UrlLauncherService().openEmail(address: "email");
          },
        );
      } on DioException catch (e) {
        LoggerService().error(title: "LOGIN ERROR", message: e);
        // ToastService().error(context, "Error occurred: ${e.response}");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "Forgot Password?",
            style: ThemeService().currentTheme.title.copyWith(
                  fontSize: 40,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              "Enter the email indicated upon registration, and we will send you password recovery link",
              style: ThemeService().currentTheme.textDefault.copyWith(
                    color: const Color(0xff69696C),
                  ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          StringFormField(
            controller: _emailTextEditingController,
            onSubmit: (value) {
              String? result = UtilsManager.validation.validateEmail(value);
              if (result != null) return result;
              _formData['email'] = value;
            },
            label: "Email",
            placeholder: "Enter your email",
          ),
          const SizedBox(
            height: 40,
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: ThemeService().currentTheme.secondary,
                  ),
                )
              : FillButton(
                  buttonText: "Send",
                  onTap: login,
                ),
        ],
      ),
    );
  }
}
