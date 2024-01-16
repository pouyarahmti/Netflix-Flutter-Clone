import 'package:flutter/material.dart';
import 'package:imdb_clone/common/components/buttons/fill_button.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

import '../components/profile_section_item.dart';

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
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Pouya",
              style: ThemeService().currentTheme.textDefault.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 32,
            ),
            ProfileSectionItem(
              title: "Edit Profile",
              icon: Icons.person,
              onTapItem: () {},
            ),
            ProfileSectionItem(
              title: "Subscription",
              icon: Icons.subscriptions,
              onTapItem: () {},
            ),
            ProfileSectionItem(
              title: "Devices",
              icon: Icons.devices,
              onTapItem: () {},
            ),
            ProfileSectionItem(
              title: "App Settings",
              icon: Icons.settings,
              onTapItem: () {},
            ),
            ProfileSectionItem(
              title: "Support",
              icon: Icons.help_center_rounded,
              onTapItem: () {},
            ),
            const Spacer(),
            FillButton(
              buttonText: "Sign Out",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
