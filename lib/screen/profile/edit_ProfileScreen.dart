import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController(text: "MemeLord_42");
  final TextEditingController _bioController = TextEditingController(text: "Sharing memes & dreams.");
  final TextEditingController _emailController = TextEditingController(text: "memelord42@email.com");

  String? _selectedGender;

  final List<String> _genderOptions = [
    "Prefer Not to Say",
    "Meme King",
    "Meme Queen",
    "Meme Entity",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Edit Profile",
          style: GoogleFonts.urbanist(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          const SizedBox(height: 12),
          // Avatar
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.deepPurple,
                      child: const Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Username
          _buildTextField("Username", _usernameController, hint: "@meme_master_3000"),
          const SizedBox(height: 18),

          // Bio
          _buildTextField("Bio", _bioController,
              hint: "Tell us your meme style", maxLines: 3),
          const SizedBox(height: 18),

          // Email
          _buildTextField("Email", _emailController, hint: "email@example.com"),
          const SizedBox(height: 18),

          // Gender
          Text("Gender", style: _labelStyle()),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _selectedGender,
            items: _genderOptions
                .map((gender) => DropdownMenuItem(
              value: gender,
              child: Text(gender, style: GoogleFonts.urbanist(fontSize: 15)),
            ))
                .toList(),
            onChanged: (value) {
              setState(() => _selectedGender = value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Save Button
          GestureDetector(
            onTap: (){},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
        ],
      ),
    );
  }

  Text _label(String label) {
    return Text(label, style: _labelStyle());
  }

  TextStyle _labelStyle() {
    return GoogleFonts.urbanist(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey.shade700);
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {String? hint, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(label),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.urbanist(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
