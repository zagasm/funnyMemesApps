import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrostedBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FrostedBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.25),
                  blurRadius: 30,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomBarItem(
                  icon: Icons.home,
                  label: "Home",
                  isActive: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                _BottomBarItem(
                  icon: Icons.search_rounded,
                  label: "Explore",
                  isActive: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                _BottomBarItem(
                  icon: Icons.add,
                  label: "Add",
                  isActive: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
                _BottomBarItem(
                  icon: Icons.person_outline,
                  label: "Profile",
                  isActive: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomBarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = LinearGradient(
      colors: [Colors.purpleAccent, Colors.deepPurple],
    );

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          gradient: isActive ? activeColor : null,
          color: isActive ? null : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.purple.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ]
              : [],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.black45,
              size: 24,
            ),
            const SizedBox(width: 6),
            if (isActive)
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

