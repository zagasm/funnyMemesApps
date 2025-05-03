import 'package:flutter/material.dart';

class AppStyles {
  static const PrimaryColor = Color(0xFFB135FF);
  static const BackgroundColor = Colors.white;
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final userData = {
    'name': '@nightowl',
    'bio': 'Dream. Build. Repeat.',
    'avatarUrl': 'https://i.pravatar.cc/150?img=58',
    'followers': '45.3K',
    'following': '123',
    'likes': '1.2M',
    'posts': List.generate(12, (index) => 'https://picsum.photos/id/${index + 50}/300'),
    'liked': List.generate(9, (index) => 'https://picsum.photos/id/${index + 100}/300'),
  };

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget _buildProfileStats(String label, String count) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 16,
            fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.black, fontSize: 12)),
      ],
    );
  }

  Widget _buildPostGrid(List<String> images) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return AnimatedScale(
          scale: 1.0,
          duration: const Duration(milliseconds: 300),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(images[index], fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppStyles.BackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: Colors.white),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(userData['avatarUrl']!.toString()),
                        ),
                        const SizedBox(height: 8),
                        Text(userData['name']!.toString(), style: theme.textTheme.headlineSmall?.copyWith(color: Colors.black)),
                        Text(userData['bio']!.toString(), style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[700])),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildProfileStats('Following', userData['following']!.toString()),
                            _buildProfileStats('Followers', userData['followers']!.toString()),
                            _buildProfileStats('Likes', userData['likes']!.toString()),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text('Follow'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppStyles.PrimaryColor,
                                side: const BorderSide(color: AppStyles.PrimaryColor),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              child: const Icon(Icons.message,color:Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(icon: Icon(Icons.grid_on, color: AppStyles.PrimaryColor)),
                    Tab(icon: Icon(Icons.favorite, color: AppStyles.PrimaryColor)),
                  ],
                  indicatorColor: AppStyles.PrimaryColor,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _tabController.index == 0
                      ? _buildPostGrid(userData['posts']! as List<String>)
                      : _buildPostGrid(userData['liked']! as List<String>),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
