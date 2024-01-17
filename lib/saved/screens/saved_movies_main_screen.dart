import 'package:flutter/material.dart';

class SavedMoviesMainScreen extends StatelessWidget {
  const SavedMoviesMainScreen({super.key});

  static const routeName = '/saved-movies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/error.png',
            ),
          ),
        ),
      ),
    );
  }
}
