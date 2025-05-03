import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/userProfile.dart';

class ProfileTabDrawer extends StatelessWidget {
  const ProfileTabDrawer({super.key});

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
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserProfileScreen(),
                    ));
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=47', // sample profile
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'GU_Abraham',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildOption(context, Icons.swap_horiz, "Switch Accounts"),
            _buildOption(context, Icons.account_balance_wallet, "Wallet: \$0.00", highlight: true),
            _buildOption(context, Icons.settings, "Settings"),
            _buildOption(context, Icons.logout, "Sign Out"),
            _buildOption(context, Icons.nightlight_round, "Night Mode"),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String title, {bool highlight = false}) {
    return ListTile(
      leading: Icon(icon, color: highlight ? Colors.blue : Colors.black),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: highlight ? Colors.blue : Colors.black,
          fontSize: 15,
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
