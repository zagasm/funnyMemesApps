import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class WithdrawMoneyScreen extends StatelessWidget {
  const WithdrawMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accounts = ["Bank A", "PayPal", "Crypto Wallet"];
    final themeColor = Colors.deepPurpleAccent;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new, color: themeColor),
        title: Text(
          "Withdraw Money",
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
            FadeInDown(child: _label("Select Account", themeColor)),
            const SizedBox(height: 12),
            ...accounts
                .asMap()
                .entries
                .map((entry) => FadeInRight(
              delay: Duration(milliseconds: 100 * entry.key + 200),
              child: _accountTile(entry.value, themeColor),
            ))
                .toList(),
            const SizedBox(height: 30),
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: _label("Withdraw Amount", themeColor),
            ),
            const SizedBox(height: 12),
            FadeInDown(
              delay: const Duration(milliseconds: 600),
              child: _styledTextField(hint: "\$0.00", color: themeColor),
            ),
            const Spacer(),
            FadeInUp(
              delay: const Duration(milliseconds: 700),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 12,
                  ),
                  icon: const Icon(Icons.download, color: Colors.white),
                  onPressed: () {},
                  label: Text(
                    "Withdraw Now",
                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _accountTile(String title, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.08), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet_rounded, color: color),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: color),
        onTap: () {},
      ),
    );
  }

  Widget _styledTextField({required String hint, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
        color: Colors.white,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        style: GoogleFonts.poppins(fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget _label(String text, Color color) => Text(
    text,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: color,
    ),
  );
}
