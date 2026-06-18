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
        Image.asset(image, height: 290),
        SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: theme.textTheme.headlineMedium,
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Text(
            description,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
