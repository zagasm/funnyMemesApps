import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.deepPurpleAccent;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new, color: themeColor),
        title: Text(
          "Send Money",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: themeColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(child: _label("Select Contact", themeColor)),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    delay: Duration(milliseconds: index * 100 + 200),
                    child: _buildAvatar(index, themeColor),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            FadeInDown(child: _label("Enter Amount", themeColor)),
            const SizedBox(height: 10),
            FadeInDown(delay: const Duration(milliseconds: 300), child: _styledTextField(hint: "\$0.00", color: themeColor)),
            const SizedBox(height: 20),
            FadeInDown(delay: const Duration(milliseconds: 400), child: _label("Note", themeColor)),
            const SizedBox(height: 10),
            FadeInDown(delay: const Duration(milliseconds: 500), child: _styledTextField(hint: "For lunch payment", color: themeColor)),
            const Spacer(),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    elevation: 12,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Send Now",
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(int index, Color themeColor) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: themeColor.withOpacity(0.1),
            backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/${index + 10}.jpg"),
          ),
          const SizedBox(height: 6),
          Text("User $index", style: GoogleFonts.poppins(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _styledTextField({required String hint, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        style: GoogleFonts.poppins(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget _label(String text, Color color) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: color,
      ),
    );
  }
}
