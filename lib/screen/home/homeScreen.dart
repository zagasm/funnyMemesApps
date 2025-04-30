import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../generated/assets.dart';

class AdvancedHomeScreen extends StatelessWidget {
  const AdvancedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E002D),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2B0A60), Color(0xFF12002F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Content Scroll
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(Assets.logoNameLogo, height: 40),
                          const SizedBox(width: 10),
                          Text("ZAGASM",
                              style: GoogleFonts.orbitron(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purpleAccent,
                              )),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.notifications, color: Colors.white),
                          SizedBox(width: 10),
                          Icon(Icons.menu, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Greeting
                  Text(
                    "Hey 👋, GU_Abraham",
                    style: GoogleFonts.orbitron(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Status Input Box (Glass style)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.07),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.15)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.edit, color: Colors.white54),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "What's on your mind? #Hashtag...",
                                style: GoogleFonts.poppins(
                                    color: Colors.white70, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Post Card
                  _postCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C1B33), Color(0xFF2C2B5E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesUser,),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GU_Abraham",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  Text("13:43 • Apr 21, 2025",
                      style: GoogleFonts.poppins(
                          color: Colors.white60, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Post Text
          Text("Ahh 😂😅",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontSize: 16, height: 1.5)),
          const SizedBox(height: 12),
          // Post Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              height: 200,
              width: double.infinity,
              Assets.imagesVice, // Replace with actual path
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
