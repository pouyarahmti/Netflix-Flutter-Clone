import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Profile",
              style: ThemeService().currentTheme.title.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.red,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Edit Profile",
                    style: ThemeService().currentTheme.textDefault.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
