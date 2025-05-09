
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletHistoryScreen extends StatelessWidget {
  const WalletHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallet History")),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          final isEven = index % 2 == 0;
          return ListTile(
            leading: Icon(
              isEven ? Icons.arrow_downward : Icons.arrow_upward,
              color: isEven ? Colors.green : Colors.red,
            ),
            title: Text(
              isEven ? "Income from client" : "Coffee shop",
              style: GoogleFonts.poppins(),
            ),
            subtitle: Text("${DateTime.now().subtract(Duration(days: index))}"),
            trailing: Text(
              isEven ? "+\$${index * 42}.00" : "-\$${index * 3}.50",
              style: TextStyle(
                color: isEven ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}