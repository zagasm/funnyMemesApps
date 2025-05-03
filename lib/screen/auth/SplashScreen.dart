import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart' show Particles, Particle;
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zagasm/screen/auth/loginScreen.dart';

import '../../generated/assets.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  List<Particle> generateParticles(int count, double width, double height) {
    final random = Random();
    return List.generate(count, (_) {
      return Particle(
        color: Colors.deepPurple.withOpacity(0.4),
        size: random.nextDouble() * 5 + 2,
        velocity: Offset(
          random.nextDouble() * 2 - 1,
          random.nextDouble() * 2 - 1,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Particles(
            awayRadius: 150,
            particles: generateParticles(70, screenWidth, screenHeight),
            height: screenHeight,
            width: screenWidth,
            onTapAnimation: true,
            awayAnimationDuration: const Duration(milliseconds: 100),
            awayAnimationCurve: Curves.linear,
            enableHover: true,
            hoverRadius: 90,
            connectDots: false,
          ),
          Center(
            child: GlassContainer(
              blur: 12,
              shadowStrength: 4,
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.deepPurple.withOpacity(0.3),
                width: 1.5,
              ),
              width: screenWidth * 0.8,
              height: screenHeight * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.logoNameLogo,
                    width: screenWidth * 0.3,
                  )
                      .animate()
                      .fadeIn(duration: 1.seconds)
                      .scale(begin: const Offset(0.8, 0.8), duration: 600.ms)
                      .shimmer(duration: 2.seconds),
                  const SizedBox(height: 30),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Zagasm App ',
                        textStyle: GoogleFonts.orbitron(
                          fontSize: screenWidth < 600 ? 30 : 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          letterSpacing: 1.5,
                        ),
                        speed: const Duration(milliseconds: 80),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 1.seconds)
                .moveY(begin: 40, duration: 1.seconds),
          ),
        ],
      ),
    );
  }
}
