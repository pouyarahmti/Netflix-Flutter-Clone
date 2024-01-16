import 'package:flutter/material.dart';
import 'package:imdb_clone/common/services/theme_service.dart';

enum ButtonStatusEnum {
  primary,
  secondary,
  info,
  error,
  disabled,
  success,
}

enum ButtonSizeEnum {
  small,
  medium,
  large,
}

class FillButton extends StatelessWidget {
  const FillButton({
    required this.buttonText,
    required this.onTap,
    this.icon,
    this.status = ButtonStatusEnum.primary,
    this.size = ButtonSizeEnum.large,
    this.isGradient = false,
    this.textStyle,
    this.iconWidget,
    this.buttonBorderRadius = 12,
    super.key,
  });

  final String buttonText;
  final VoidCallback onTap;
  final IconData? icon;
  final ButtonSizeEnum size;
  final ButtonStatusEnum status;
  final bool isGradient;
  final TextStyle? textStyle;
  final Widget? iconWidget;
  final double buttonBorderRadius;

  @override
  Widget build(BuildContext context) {
    late double height;
    late double width;
    late double iconSize;
    late Color backgroundColor;
    Gradient? backgroundGradient;

    void setSize(ButtonSizeEnum size) {
      switch (size.name) {
        case "small":
          width = MediaQuery.of(context).size.width * 0.4;
          height = MediaQuery.of(context).size.width * 0.1;
          iconSize = MediaQuery.of(context).size.width * 0.1;
          break;
        case "medium":
          width = MediaQuery.of(context).size.width * 0.5;
          height = MediaQuery.of(context).size.width * 0.1;
          iconSize = MediaQuery.of(context).size.width * 0.15;
          break;
        case "large":
          width = double.infinity;
          height = MediaQuery.of(context).size.width * 0.12;
          iconSize = MediaQuery.of(context).size.width * 0.15;
          break;
      }
    }

    void setButtonColor(ButtonStatusEnum status) {
      switch (status.name) {
        case "primary":
          backgroundColor = ThemeService().currentTheme.secondary;
          break;

        case "secondary":
          backgroundColor = const Color(0xff2C2C2D);
          break;

        case "error":
          backgroundColor = ThemeService().currentTheme.danger;

          break;
        case "disabled":
          backgroundColor = ThemeService().currentTheme.disabled;
          break;
        case "info":
          backgroundColor = ThemeService().currentTheme.info;

          break;
        case "success":
          backgroundColor = ThemeService().currentTheme.success;

          break;
        default:
          backgroundColor = ThemeService().currentTheme.primary;
      }
    }

    setSize(size);
    setButtonColor(status);

    return ElevatedButton(
      onPressed: () {
        if (status.name == "disabled") return;
        onTap();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(buttonBorderRadius),
          gradient: isGradient ? backgroundGradient : null,
        ),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  buttonText,
                  maxLines: 2,
                  textAlign: icon == null ? TextAlign.center : TextAlign.left,
                  style: textStyle ??
                      ThemeService().currentTheme.textDefault.copyWith(
                            color:
                                status.name == ButtonStatusEnum.secondary.name
                                    ? ThemeService().currentTheme.secondary
                                    : Colors.white,
                            fontSize: size == ButtonSizeEnum.small
                                ? 16
                                : buttonText.length < 15
                                    ? 20
                                    : 14,
                          ),
                ),
              ),
              if (icon != null || iconWidget != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: iconWidget ??
                      Icon(
                        icon,
                        color: Colors.white,
                        size: iconSize,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
