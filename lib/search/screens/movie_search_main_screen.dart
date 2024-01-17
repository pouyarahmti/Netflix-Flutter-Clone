import 'package:flutter/material.dart';

class MovieSearchMainScreen extends StatelessWidget {
  const MovieSearchMainScreen({super.key});

  static const routeName = '/movie-search';

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
