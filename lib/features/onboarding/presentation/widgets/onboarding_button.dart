import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const OnboardingButton({
    super.key,
    required this.visible,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(microseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child:
          visible
              ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
                child: FloatingActionButton(
                  key: ValueKey(icon),
                  onPressed: onPressed,
                  backgroundColor: backgroundColor,
                  elevation: 0,
                  shape: CircleBorder(),
                  child: Icon(icon, color: iconColor),
                ),
              )
              : const SizedBox(),
    );
  }
}
