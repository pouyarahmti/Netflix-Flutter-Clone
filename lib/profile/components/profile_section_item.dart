import 'package:flutter/material.dart';

import '../../common/services/theme_service.dart';

class ProfileSectionItem extends StatelessWidget {
  const ProfileSectionItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTapItem});

  final String title;
  final IconData icon;
  final Function onTapItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapItem(),
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
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
      ),
    );
  }
}
