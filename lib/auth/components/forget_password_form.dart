import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/components/buttons/fill_button.dart';

import '../../common/components/form_fields/form_fields/string_form_field.dart';
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
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    initFormData();
    super.initState();
  }

  void initFormData() {
    _formData = {
      "email": _emailTextEditingController.text,
      "password": _passwordTextEditingController.text,
    };
  }

  void login() async {
    if (!_formKey.currentState!.validate()) {
      LoggerService().warning(
          title: "LOGIN FORM - INVALID FORM", message: json.encode(_formData));
      // ToastService().error(context, "FORM INVALID");
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        ToastService().showErrorToast("HELLO");
        // final loginResponse = await AuthService().login(_formData);
        // LoggerService().simple("LOGIN SUCCESSFUL: $loginResponse");
        // ToastService().success(context, "Login Successful");

        // await SecureStorageService()
        //     .write(key: "token", value: loginResponse['tokens']['access']);
        // Future.delayed(const Duration(seconds: 1), () {
        //   ToastService().hide(context);
        //   context.goNamed(HomeScreen.routeName);
        // });
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
              // String? result = UtilsManager.validation.validateEmpty(value);
              // if (result != null) return result;
              _formData['email'] = value;
            },
            label: "Email",
            placeholder: "Enter your email",
          ),
          const SizedBox(
            height: 40,
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
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
