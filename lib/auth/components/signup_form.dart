import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb_clone/common/components/form_fields/form_fields/password_form_field.dart';
import 'package:imdb_clone/common/services/toast_service.dart';
import 'package:imdb_clone/common/services/url_launcher_service.dart';

import '../../common/components/buttons/fill_button.dart';

import '../../common/components/form_fields/form_fields/string_form_field.dart';
import '../../common/services/dialog_service.dart';
import '../../common/services/logger_service.dart';
import '../../common/services/theme_service.dart';
import '../../common/utils/utils_manager.dart';
import '../../home/screens/home_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _formData;

  bool _isPasswordMatch = false;

  bool _isLoading = false;

  // TEXT EDITING CONTROLLERS
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    initFormData();
    super.initState();
  }

  void initFormData() {
    _formData = {
      "name": _nameTextEditingController.text,
      "lastName": _lastNameTextEditingController.text,
      "password": _passwordTextEditingController.text,
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
        ToastService().showSuccessToast("Signup Successful");
        context.goNamed(HomeScreen.routeName);
      } on DioException catch (e) {
        LoggerService().error(title: "FORGET PASSWORD ERROR", message: e);
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
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "Signup",
            style: ThemeService().currentTheme.title.copyWith(
                  fontSize: 40,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          StringFormField(
            controller: _nameTextEditingController,
            onSubmit: (value) {
              String? result = UtilsManager.validation.validateEmpty(value);
              if (result != null) return result;
              _formData['name'] = value;
            },
            label: "Name",
            placeholder: "Enter your name",
          ),
          const SizedBox(
            height: 16,
          ),
          StringFormField(
            controller: _lastNameTextEditingController,
            onSubmit: (value) {
              String? result = UtilsManager.validation.validateEmpty(value);
              if (result != null) return result;
              _formData['email'] = value;
            },
            label: "Lastname",
            placeholder: "Enter your lastname",
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
            controller: _passwordTextEditingController,
            onSubmit: (value) {
              String? result = UtilsManager.validation.validateEmail(value);
              if (result != null) return result;
              _formData['email'] = value;
            },
            label: "Password",
            placeholder: "Enter your password",
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordFormField(
            controller: _confirmPasswordTextEditingController,
            isConfirmPasswordField: true,
            isPasswordMatch: _isPasswordMatch,
            onChanged: (value) {
              String? validationResult =
                  UtilsManager.validation.validatePasswordMatching(
                value,
                _passwordTextEditingController.text,
              );
              if (validationResult != null) {
                setState(
                  () {
                    _isPasswordMatch = false;
                  },
                );
              } else {
                setState(
                  () {
                    _isPasswordMatch = true;
                  },
                );
              }
            },
            onSubmit: () {},
            label: "Confirm Password",
            placeholder: "Enter your password again",
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
