import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/components/buttons/fill_button.dart';

import '../../common/components/form_fields/form_fields/password_form_field.dart';
import '../../common/components/form_fields/form_fields/string_form_field.dart';
import '../../common/services/dialog_service.dart';
import '../../common/services/logger_service.dart';
import '../../common/services/theme_service.dart';
import '../../common/services/toast_service.dart';
import '../../common/utils/utils_manager.dart';
import '../../home/screens/home_screen.dart';
import '../screens/forget_password_screen.dart';
// import '../../common/utils/utils_manager.dart';
// import '../../home/screens/home_screen.dart';
// import '../screens/forget_password_screen.dart';
// import '../services/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
        await Future.delayed(
          const Duration(seconds: 2),
        );
        ToastService().showSuccessToast("Login Successful");
        context.goNamed(HomeScreen.routeName);
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
            "Login",
            style: ThemeService().currentTheme.title.copyWith(
                  fontSize: 40,
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
            height: 16,
          ),
          PasswordFormField(
            onSubmit: (value) {
              String? result = UtilsManager.validation.validateEmpty(value);
              if (result != null) return result;
              _formData["password"] = value;
            },
            controller: _passwordTextEditingController,
            label: "Password",
            placeholder: "Enter your password",
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(ForgetPasswordScreen.routeName);
              },
              child: Text(
                "Forgot your password?",
                style: ThemeService().currentTheme.textDefault.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.justify,
              ),
            ),
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
                  buttonText: "Login",
                  onTap: login,
                ),
        ],
      ),
    );
  }
}
