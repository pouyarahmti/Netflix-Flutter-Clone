import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginIconsContainer extends StatelessWidget {
  const LoginIconsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginIcon(
          icon: FontAwesomeIcons.apple,
        ),
        SizedBox(
          width: 12,
        ),
        LoginIcon(
          icon: FontAwesomeIcons.facebookF,
        ),
        SizedBox(
          width: 12,
        ),
        LoginIcon(
          icon: FontAwesomeIcons.google,
        ),
      ],
    );
  }
}

class LoginIcon extends StatelessWidget {
  const LoginIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff2C2C2E),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 32,
        ),
      ),
    );
  }
}
