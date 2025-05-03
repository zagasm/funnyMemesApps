import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning }

void showCustomSnackbar({
  required BuildContext context,
  required String title,
  required String subtitle,
  required SnackbarType type,
}) {
  // 💜 Purple-themed colors
  const Color primaryPurple = Color(0xFF6C4DFF);     // Main purple
  const Color backgroundDark = Colors.white;     // Dark background
  const Color borderPurple = Color(0xFF6C4DFF);       // Border highlight

  // 🔔 Type-based styles
  Color circleColor;
  IconData icon;

  switch (type) {
    case SnackbarType.success:
      circleColor = Color(0xFF00E58F); // Teal green
      icon = Icons.check_circle_outline;
      break;
    case SnackbarType.error:
      circleColor = Color(0xFFFF4D67); // Soft red
      icon = Icons.error_outline;
      break;
    case SnackbarType.warning:
      circleColor = Color(0xFFFFC107); // Amber
      icon = Icons.warning_amber_rounded;
      break;
  }

  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50,
      right: 24,
      child: Material(
        color: Colors.transparent,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 400),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(30 * (1 - value), 0),
                child: child,
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            constraints: const BoxConstraints(maxWidth: 360),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundDark.withOpacity(0.9),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: borderPurple.withOpacity(0.4), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: primaryPurple.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(icon, color: Colors.black, size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 5), () => overlayEntry.remove());
}
