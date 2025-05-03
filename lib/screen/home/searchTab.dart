import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../generated/assets.dart';

class AnimatedSearchTab extends StatefulWidget {
  const AnimatedSearchTab({super.key});

  @override
  State<AnimatedSearchTab> createState() => _AnimatedSearchTabState();
}

class _AnimatedSearchTabState extends State<AnimatedSearchTab> {
  int selectedFilterIndex = 0;
  final List<String> filters = ["Posts", "Users", "Pages", "Groups", "Events"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.logoNameLogo, height: 36),
                        const SizedBox(width: 8),
                        Text(
                          "ZAGASM",
                          style: GoogleFonts.orbitron(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.notifications_none, color: Colors.black87),
                        SizedBox(width: 12),
                        Icon(Icons.menu, color: Colors.black87),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Title & Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Search",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        "Discover new people, make new connections\nand create exciting friendships!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Search Bar
              ZoomIn(
                duration: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GlassmorphicContainer(
                    width: double.infinity,
                    height: 60,
                    borderRadius: 30,
                    blur: 25,
                    alignment: Alignment.center,
                    border: 1.5,
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.purpleAccent.withOpacity(0.4),
                        Colors.cyanAccent.withOpacity(0.3),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.white70),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Search for something amazing...",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // // Custom Tab Row
              // Padding(
              //   padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
              //   child: GlassmorphicContainer(
              //     width: double.infinity,
              //     height: 48,
              //     borderRadius: 30,
              //     blur: 20,
              //     alignment: Alignment.center,
              //     border: 1,
              //     linearGradient: LinearGradient(
              //       colors: [
              //         Colors.white.withOpacity(0.2),
              //         Colors.white.withOpacity(0.05),
              //       ],
              //     ),
              //     borderGradient: LinearGradient(
              //       colors: [
              //         Colors.purpleAccent.withOpacity(0.4),
              //         Colors.cyanAccent.withOpacity(0.3),
              //       ],
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         _buildTabItem("People", false),
              //         _buildTabItem("Posts", false),
              //         _buildTabItem("Trending", false),
              //       ],
              //     ),
              //   ),
              // ),

              const SizedBox(height: 35),

              // Animated Filters
              FadeInRight(
                duration: const Duration(milliseconds: 700),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      return _buildFilter(
                        filters[index],
                        selectedFilterIndex == index,
                            () {
                          setState(() {
                            selectedFilterIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

              const Spacer(),

              // No Data Section
              BounceInUp(
                duration: const Duration(milliseconds: 1000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Centered Image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesNoData, height: 100),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Modified Button
                    GlassmorphicContainer(
                      width: 200,
                      height: 45,
                      borderRadius: 16,
                      blur: 20,
                      alignment: Alignment.center,
                      border: 1,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.purple,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.purple.withOpacity(0.3),
                          Colors.purple.withOpacity(0.2),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Action when the button is pressed
                        },
                        child: const Text(
                          'Try Again', // Button label changed to "Try Again"
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 8,
                                color: Colors.blueAccent,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              const Spacer(),


            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilter(String label, bool isSelected, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
              width: 1.2,
            ),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]
                : [],
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.black87 : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
