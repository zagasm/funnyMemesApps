import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LegendaryNotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'like',
      'user': 'LunaGalaxy',
      'avatar': 'https://i.pravatar.cc/150?img=64',
      'message': 'liked your latest video!',
      'time': '1m ago',
    },
    {
      'type': 'follow',
      'user': 'NeoMatrix',
      'avatar': 'https://i.pravatar.cc/150?img=18',
      'message': 'started following you.',
      'time': '4m ago',
    },
    {
      'type': 'comment',
      'user': 'RayaSoul',
      'avatar': 'https://i.pravatar.cc/150?img=12',
      'message': 'commented: “🔥 This is art!”',
      'time': '9m ago',
    },
    {
      'type': 'mention',
      'user': 'NovaDusk',
      'avatar': 'https://i.pravatar.cc/150?img=34',
      'message': 'mentioned you in a post.',
      'time': '20m ago',
    },
  ];

  IconData _getIcon(String type) {
    switch (type) {
      case 'like':
        return Icons.favorite_rounded;
      case 'comment':
        return Icons.mode_comment_rounded;
      case 'follow':
        return Icons.person_add_alt_1_rounded;
      case 'mention':
        return Icons.alternate_email_rounded;
      default:
        return Icons.notifications_active_rounded;
    }
  }

  Color _getGlowColor(String type) {
    switch (type) {
      case 'like':
        return Colors.purpleAccent.shade100;
      case 'comment':
        return Colors.deepPurpleAccent;
      case 'follow':
        return Colors.deepPurple;
      case 'mention':
        return Colors.purple;
      default:
        return Colors.deepPurple.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Activity',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final n = notifications[index];
                final glowColor = _getGlowColor(n['type']);

                return AnimatedContainer(
                  duration: Duration(milliseconds: 400 + index * 100),
                  curve: Curves.easeOutExpo,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: glowColor.withOpacity(0.25)),
                    boxShadow: [
                      BoxShadow(
                        color: glowColor.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(n['avatar']),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: glowColor,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Icon(
                              _getIcon(n['type']),
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: n['user'],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const TextSpan(text: '  '),
                                  TextSpan(
                                    text: n['message'],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              n['time'],
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (n['type'] == 'follow')
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade50,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            elevation: 0,
                          ),
                          child: Text(
                            'Follow Back',
                            style: GoogleFonts.poppins(
                              color: glowColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
