import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zagasm/screen/wallet/recieve_Money.dart';
import 'package:zagasm/screen/wallet/sendMoney.dart';

class AdvancedWalletScreen extends StatelessWidget {
  const AdvancedWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Wallet",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildWalletCard(size, context),
            const SizedBox(height: 30),
            _buildActionButtons(context),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Recent Transactions",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.history),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const WalletHistoryScreen()),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildTransactionList()
          ],
        ),
      ),
    );
  }

  Widget _buildWalletCard(Size size, BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Wallet Details"),
                content: const Text("Full card reveal or options here."),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"))
                ],
              ));
        },
        child: Container(
          width: size.width * 0.88,
          height: 200,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6A5AE0), Color(0xFF9272EC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.4),
                blurRadius: 30,
                spreadRadius: 4,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Wallet Balance",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  )),
              Text("\$12,430.87",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("****  5467",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white70,
                      )),
                  const Icon(Icons.credit_card, color: Colors.white, size: 28),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // GestureDetector(
          //     onTap: (){
          //       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddMoneyScreen()));
          //     },
          //     child: _walletAction(Icons.add_circle, "Add Money", Colors.deepPurple)),
          // GestureDetector(
          //     onTap: (){
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (ctx)=>SendMoneyScreen()));
          //     },
          //     child: _walletAction(Icons.send, "Send", Colors.green)),
          GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx)=>WithdrawMoneyScreen()));
              },
              child: _walletAction(Icons.money_off, "Withdraw", Colors.redAccent)),
        ],
      ),
    );
  }

  Widget _walletAction(IconData icon, String title, Color color) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(14),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(title,
            style: GoogleFonts.poppins(
              fontSize: 12,
            )),
      ],
    );
  }

  Widget _buildTransactionList() {
    final transactions = [
      {"title": "Netflix Subscription", "amount": "-\$15.99", "type": "debit"},
      {"title": "Stripe Deposit", "amount": "+\$2,000", "type": "credit"},
      {"title": "Coffee Shop", "amount": "-\$4.80", "type": "debit"},
      {"title": "App Earnings", "amount": "+\$842.10", "type": "credit"},
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (_, index) {
        final tx = transactions[index];
        final isCredit = tx["type"] == "credit";
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: const Offset(0, 6),
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(
                  isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                  color: isCredit ? Colors.green : Colors.redAccent,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  tx["title"]!,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ]),
              Text(
                tx["amount"]!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isCredit ? Colors.green : Colors.redAccent,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

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
