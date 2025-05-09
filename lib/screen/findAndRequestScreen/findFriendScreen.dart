import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindFriendsScreen extends StatelessWidget {
  const FindFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = List.generate(10, (index) => {
      'name': 'Friend $index',
      'image': 'https://randomuser.me/api/portraits/women/${30 + index}.jpg',
      'status': index % 2 == 0 ? 'Online' : 'Offline',
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Find Friends", style: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search friends...",
                hintStyle: GoogleFonts.poppins(color: Colors.deepPurple.shade200),
                prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.deepPurple.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: users.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                final user = users[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 28, backgroundImage: NetworkImage(user['image']!)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(user['name']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        user['status']!,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: user['status'] == 'Online' ? Colors.green : Colors.grey),
                      ),
                      const SizedBox(width: 12),
                   Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Add",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),

                  )



                   ) ])
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
