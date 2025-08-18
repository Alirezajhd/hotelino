import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const OnboardingItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 390),
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
