import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../generated/assets.dart';
import '../../widgets/postDetail.dart';
import '../chatScreen.dart';

class AdvancedHomeScreen extends StatefulWidget {
  const AdvancedHomeScreen({super.key});

  @override
  State<AdvancedHomeScreen> createState() => _AdvancedHomeScreenState();
}

class _AdvancedHomeScreenState extends State<AdvancedHomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: _buildSideDrawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(Assets.logoNameLogo, height: 40),
                      const SizedBox(width: 10),
                      Text(
                        "ZAGASM",
                        style: GoogleFonts.orbitron(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  username: "NightOwl",
                                  avatarUrl: "https://i.pravatar.cc/150?img=58",
                                ),
                            ));
                          },
                          child:  Icon(Icons.chat_bubble_outline, color: Colors.black87)),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications, color: Colors.black87),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState?.openDrawer(),
                        child: const Icon(Icons.menu, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
             Column(children: [
               Text(
                 "Hey 👋, GU_Abraham",
                 style: GoogleFonts.orbitron(
                   fontSize: 26,
                   fontWeight: FontWeight.bold,
                   color: Colors.black87,
                 ),
               ),
               const SizedBox(height: 10),
               ClipRRect(
                 borderRadius: BorderRadius.circular(20),
                 child: BackdropFilter(
                   filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                   child: Container(
                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                     decoration: BoxDecoration(
                       color: Colors.grey.withOpacity(0.05),
                       border: Border.all(color: Colors.black12),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       children: [
                         const Icon(Icons.edit, color: Colors.black45),
                         const SizedBox(width: 10),
                         Expanded(
                           child: Text(
                             "What's Funny Today? #Hashtag...",
                             style: GoogleFonts.poppins(
                               color: Colors.black54,
                               fontSize: 14,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 10),
               _msgCard(),
             ],),
              SizedBox(height: 3,),
              // Tabs
              TabBar(
                controller: _tabController,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.black45,
                indicatorColor: Colors.deepPurple,
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: 'Following'),
                  Tab(text: 'For You'),
                ],
              ),
              const SizedBox(height: 20),

              // Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Following Tab
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PostDetailScreen(),
                              ));
                            },
                            child: _postCard(),
                          ),
                          const SizedBox(height: 10),
                          _postCard(),
                        ],
                      ),
                    ),

                    // For You Tab
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            "This is the 'For You' tab content ✨",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _msgCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(Assets.imagesUser),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning GU_Abraham",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "My padii! How far? Today na fresh start, so make we ginger well well for the hustle.",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(Assets.imagesUser),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GU_Abraham",
                      style: GoogleFonts.poppins(
                          color: Colors.black87, fontWeight: FontWeight.w600)),
                  Text("13:43 • Apr 21, 2025",
                      style: GoogleFonts.poppins(
                          color: Colors.black54, fontSize: 12)),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.black45),
              )
            ],
          ),
          const SizedBox(height: 12),
          Text("Ahh 😂😅",
              style: GoogleFonts.poppins(
                  color: Colors.black87, fontSize: 16, height: 1.5)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              Assets.imagesVice,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _actionItem(Icons.bookmark_border, "Save"),
              _actionItem(Icons.share, "Share"),
              _actionItem(Icons.download_rounded, "Download"),
              _actionItem(Icons.emoji_emotions_outlined, "React"),
              //_iconStat(Icons.remove_red_eye_outlined, '64 Views'),
            ],
          )
        ],
      ),
    );
  }
  Widget _iconStat(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.aBeeZee(
            color: Colors.black87,
            fontSize: 13.5,
          ),
        ),
      ],
    );
  }
  Widget _actionItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 6),
          Text(label, style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.imagesUser, height: 40),
                  const SizedBox(height: 10),
                  Text("Welcome Back", style: GoogleFonts.poppins(fontSize: 16)),
                  Text("Abraham", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            _buildDrawerItem(Icons.feed, "News Feed"),
            _buildDrawerItem(Icons.bookmark, "Saved Posts"),
            _buildDrawerItem(Icons.history, "Memories"),
            const Divider(),
            _buildDrawerItem(Icons.campaign, "Ads Manager"),
            _buildDrawerItem(Icons.account_balance_wallet, "Wallet"),
            const Divider(),
            _buildDrawerItem(Icons.people, "People"),
            _buildDrawerItem(Icons.flag, "Pages"),
            _buildDrawerItem(Icons.group, "Groups"),
            _buildDrawerItem(Icons.event, "Events"),
            _buildDrawerItem(Icons.local_offer, "Offers"),
            _buildDrawerItem(Icons.work, "Jobs"),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
      onTap: () {},
    );
  }
}
