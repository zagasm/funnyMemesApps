import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'MemeCreationScreen.dart';

class AddTabDrawer extends StatelessWidget {
  const AddTabDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ListView(
          controller: controller,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // First Row: Large Single Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: _buildAddButton(context, Icons.post_add, "Add Post", isMain: true, onTap: () => _addPost(context)),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Second Row: Two Buttons
            Row(
              children: [
                Expanded(child: _buildAddButton(context, Icons.photo, "Add Photo", onTap: () => _addPhoto(context))),
                const SizedBox(width: 12),
                Expanded(child: _buildAddButton(context, Icons.video_call, "Add Video",onTap: (){})),
              ],
            ),

            const SizedBox(height: 24),

            // Third Row: Two Buttons
            Row(
              children: [
                Expanded(child: _buildAddButton(context, Icons.event, "Add Event",onTap: (){})),
                const SizedBox(width: 12),
                Expanded(child: _buildAddButton(context, Icons.group_add, "Add Group",onTap: (){})),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // The button widget
  Widget _buildAddButton(BuildContext context, IconData icon, String label, {bool isMain = false, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isMain
                ? [Colors.deepPurpleAccent, Colors.deepPurple.shade400]
                : [Colors.white, Colors.grey.shade100],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isMain
                  ? Colors.deepPurpleAccent.withOpacity(0.4)
                  : Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: isMain ? Colors.deepPurple.shade300 : Colors.grey.shade300,
            width: 1.2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isMain ? 40 : 30,
              color: isMain ? Colors.white : Colors.deepPurple,
              shadows: isMain
                  ? [
                const Shadow(
                  blurRadius: 8,
                  color: Colors.white,
                  offset: Offset(0, 0),
                ),
              ]
                  : [],
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isMain ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Action for "Add Post" button
  void _addPost(BuildContext context) {
    // Navigate to meme creation screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemeCreationScreen(),
      ),
    );
  }

  // Action for "Add Photo" button
  void _addPhoto(BuildContext context) {
    // Trigger image picker to select photo
    _pickImage();
  }

  // Image picker for photo selection
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Do something with the picked image (e.g., show in meme creation screen)
    }
  }
}
