import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/assets.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean modern background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Post Image
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                   Assets.imagesVice,
                    height: 500,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              // Username
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      'جU_Abraham',
                      style: GoogleFonts.orbitron(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
          
              // Stats Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _iconStat(Icons.thumb_up_alt_outlined, '1'),
                    _iconStat(Icons.comment_outlined, '0 Comments'),
                    _iconStat(Icons.remove_red_eye_outlined, '64 Views'),
                  ],
                ),
              ),
          
              const SizedBox(height: 30),
          
              // Message Prompt
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Please log in to like, share and comment!",
                  style: GoogleFonts.orbitron(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
          
              const SizedBox(height: 40),
          
              // Comment Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.message_outlined, color: Colors.grey),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: GoogleFonts.orbitron(color: Colors.black),
                              decoration: const InputDecoration(
                                hintText: "Write a comment...",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Icon(Icons.send, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconStat(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.aBeeZee(
            color: Colors.black87,
            fontSize: 13.5,
          ),
        ),
      ],
    );
  }
}
