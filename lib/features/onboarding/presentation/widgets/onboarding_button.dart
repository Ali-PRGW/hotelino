import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backGroundColor;
  final Color iconColor;

  const OnboardingButton({
    super.key,
    required this.visible,
    required this.icon,
    required this.onPressed,
    required this.backGroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: visible
          ? Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).colorScheme.primary , width: 1)
              ),
                child: FloatingActionButton(
                  key: ValueKey(icon),
                  onPressed: onPressed,
                  elevation: 0,
                  backgroundColor: backGroundColor,
                  shape: CircleBorder(),
                  child: Icon(icon, color: iconColor),
                ),
              ),
          )
          : const SizedBox(),
    );
  }
}
