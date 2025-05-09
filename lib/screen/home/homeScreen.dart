import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../generated/assets.dart';
import '../../widgets/postDetail.dart';
import '../chatScreen.dart';
import '../findAndRequestScreen/findFriendScreen.dart';
import '../findAndRequestScreen/friend_RequetsScreen.dart';
import '../notificationScreen.dart';
import '../settings.dart';

class AdvancedHomeScreen extends StatefulWidget {
  const AdvancedHomeScreen({super.key});

  @override
  State<AdvancedHomeScreen> createState() => _AdvancedHomeScreenState();
}

class _AdvancedHomeScreenState extends State<AdvancedHomeScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  File? _selectedImage;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> memes = [
      {
        "image": Assets.imagesVice,
        "isTemplate": true,
        "templateName": "Drake Meme"
      },
      {
        "image": Assets.imagesVice,
        "isTemplate": false,
        "templateName": ""
      },
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: _buildSideDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 30),
              _buildGreetingAndInput(),
              const SizedBox(height: 3),
              _buildTabs(),
              const SizedBox(height: 20),
              _buildTabViewContent(memes),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header with Profile Info
          UserAccountsDrawerHeader(
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
            currentAccountPicture: const CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
            ),
            accountName: Text(
              "MemeMaster_99",
              style: GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "mememaster@email.com",
              style: GoogleFonts.urbanist(fontSize: 14, color: Colors.white70),
            ),
          ),

          // List Items
          _buildDrawerTile(
            icon: Icons.person_add_alt_1,
            label: "Friend Requests",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FriendRequestScreen()));
            },
          ),
          _buildDrawerTile(
            icon: Icons.search_rounded,
            label: "Find Friends",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FindFriendsScreen()));
            },
          ),
          _buildDrawerTile(
            icon: Icons.settings_rounded,
            label: "Settings",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SettingsScreen()));
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Container(
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
              child: ElevatedButton.icon(
                onPressed: () {
                  // Log out action
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout_rounded, color: Colors.white),
                label: const Text("Logout", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Let gradient show
                  shadowColor: Colors.transparent,     // Remove default shadow
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

// Custom Drawer Tile Builder
  Widget _buildDrawerTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurpleAccent),
      title: Text(
        label,
        style: GoogleFonts.urbanist(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hoverColor: Colors.deepPurpleAccent.withOpacity(0.05),
      onTap: onTap,
      horizontalTitleGap: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }


  Widget _buildHeader(BuildContext context) {
    return Row(
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    username: "NightOwl",
                    avatarUrl: "https://i.pravatar.cc/150?img=58",
                  ),
                ),
              ),
              child: const Icon(Icons.chat_bubble_outline, color: Colors.black87),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LegendaryNotificationScreen()),
              ),
              child: const Icon(Icons.notifications, color: Colors.black87),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: const Icon(Icons.menu, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGreetingAndInput() {
    return Column(
      children: [
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
              child: GestureDetector(
                onTap: _pickImage,
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
        ),
        const SizedBox(height: 10),
        _msgCard(),
      ],
    );
  }

  Widget _buildTabs() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.deepPurple,
      unselectedLabelColor: Colors.black45,
      indicatorColor: Colors.deepPurple,
      labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      tabs: const [
        Tab(text: 'Following'),
        Tab(text: 'For You'),
      ],
    );
  }

  Widget _buildTabViewContent(List<Map<String, dynamic>> memes) {
    return IndexedStack(
      index: _tabController.index,
      children: [
        _buildFollowingTab(),
        _buildForYouTab(memes),
      ],
    );
  }

  Widget _buildFollowingTab() {
    return Column(
      children: [
        if (_selectedImage != null) _buildPostCard(imageFile: _selectedImage),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostDetailScreen()),
          ),
          child: Column(
            children: [
              _buildPostCard(),
              const SizedBox(height: 10),
              _buildTemplatesCard(imageFile: _selectedImage),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildForYouTab(List<Map<String, dynamic>> memes) {
    return Column(
      children: memes.map((meme) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black12, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                spreadRadius: 1,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    meme["image"],
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              if (meme["isTemplate"])
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.deepPurple.withOpacity(0.25), width: 1),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add_circle_outline,
                            color: Colors.deepPurple, size: 22),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Add Template: ${meme["templateName"]}",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.deepPurple.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
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
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
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

  Widget _buildPostCard({File? imageFile}) {
    return
      Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            child: imageFile != null
                ? Image.file(imageFile,
                height: 400, width: double.infinity, fit: BoxFit.cover)
                : Image.asset(
              Assets.imagesVice,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.bookmark_border, color: Colors.black54),
              Icon(Icons.share, color: Colors.black54),
              Icon(Icons.emoji_emotions_outlined, color: Colors.black54),
              Icon(Icons.remove_red_eye, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTemplatesCard({File? imageFile}) {
    return
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
          boxShadow: const [
          BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 4),
        ),
        ],
      ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
    child: Stack(
    children: [
    SizedBox(
    height: 400,
    width: double.infinity,
    child: imageFile != null
    ? Image.file(imageFile, fit: BoxFit.cover)
        : Image.asset(Assets.imagesVice, fit: BoxFit.cover),
    ),
    Positioned(
    bottom: 180,
    left: 10,
    child: Row(
    children: [
    Image.asset(
    Assets.logoNameLogo,
    height: 32,
    width: 32,
    ),
    const SizedBox(width: 6),
    Text(
    '@GU_Abraham',
    style: GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w800,
    shadows: [
    Shadow(
    blurRadius: 4,
    color: Colors.black.withOpacity(0.5),
    offset: const Offset(1, 1),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
      Positioned(
      bottom: 0,
      right: 0,
      left: 121,
      child: Opacity(
        opacity: 0.3, // 👈 Subtle and modern fade
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Optional: soft round edges
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5), // Very light blur
                child: Image.asset(
                  Assets.imagesZAGASMLOGO,
                  height: 70,
                  width: 210,
                  //color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    ),



    ],
    ),
    ),
    const SizedBox(height: 14),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Icon(Icons.bookmark_border, color: Colors.black54),
    Icon(Icons.share, color: Colors.black54),
    Icon(Icons.emoji_emotions_outlined, color: Colors.black54),
    Icon(Icons.remove_red_eye, color: Colors.black54),
    ],
    ),
    const SizedBox(height: 14),
    buildAddTemplateButton(templateName: 'Free',onPressed: (){})
    ],
    ),
    );


  }

  //ADD Template
  Widget buildAddTemplateButton({
    required String templateName,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child:
      Stack(
        children:[
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.06),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.deepPurple.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.add_circle_outline,
                  color: Colors.deepPurple, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Use Template: $templateName",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
              ),
            ],
          ),

        ),
        ]
      ),
    );
  }

}
