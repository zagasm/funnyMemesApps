import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zagasm/screen/profile/edit_ProfileScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle sectionTitle = GoogleFonts.urbanist(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade600,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.urbanist(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
              ).animate().fadeIn().slide(),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gu_ibrahaim", style: GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.w600))
                      .animate()
                      .fadeIn(delay: 300.ms),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:
                      (ctx)=>EditProfileScreen()));
                    },
                    child: Text("Edit Profile", style: GoogleFonts.urbanist(color: Colors.deepPurple)),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 30),

          Text("ACCOUNT", style: sectionTitle).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 8),
          _buildTile(Icons.person_outline, "Profile", onTap: () {}).animate().fadeIn(delay: 500.ms),
          _buildTile(Icons.lock_outline, "Privacy", onTap: () {}).animate().fadeIn(delay: 600.ms),
          _buildTile(Icons.emoji_emotions_outlined, "Laugh Mode", onTap: () {}).animate().fadeIn(delay: 700.ms),

          const SizedBox(height: 28),

          Text("NOTIFICATIONS", style: sectionTitle).animate().fadeIn(delay: 800.ms),
          const SizedBox(height: 8),
          _buildSwitchTile(Icons.notifications_active_outlined, "Meme Notifications", true).animate().fadeIn(delay: 900.ms),
          _buildSwitchTile(Icons.message_outlined, "Message Sounds", false).animate().fadeIn(delay: 1000.ms),
          _buildSwitchTile(Icons.nightlight_round, "Dark Mode", true).animate().fadeIn(delay: 1100.ms),

          const SizedBox(height: 28),

          Text("APP", style: sectionTitle).animate().fadeIn(delay: 1200.ms),
          const SizedBox(height: 8),
          _buildTile(Icons.star_border, "Rate this App", onTap: () {}).animate().fadeIn(delay: 1300.ms),
          _buildTile(Icons.feedback_outlined, "Send Feedback", onTap: () {}).animate().fadeIn(delay: 1400.ms),
          _buildTile(Icons.info_outline, "About", onTap: () {}).animate().fadeIn(delay: 1500.ms),

          const SizedBox(height: 36),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.withOpacity(0.1),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.logout),
              label: Text(
                "Log Out",
                style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ).animate().fadeIn(delay: 1600.ms),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(
        title,
        style: GoogleFonts.urbanist(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool initial) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool value = initial;
        return SwitchListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          secondary: Icon(icon, color: Colors.deepPurple),
          title: Text(
            title,
            style: GoogleFonts.urbanist(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          value: value,
          activeColor: Colors.deepPurpleAccent,
          onChanged: (val) => setState(() => value = val),
        );
      },
    );
  }
}