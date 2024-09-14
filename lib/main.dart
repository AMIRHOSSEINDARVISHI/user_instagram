import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: InstagramUI(),
    );
  }
}

class InstagramUI extends StatelessWidget {
  final List<String> storyImages = [
    'https://randomuser.me/api/portraits/men/32.jpg',
    'https://randomuser.me/api/portraits/women/44.jpg',
    'https://randomuser.me/api/portraits/men/65.jpg',
    'https://randomuser.me/api/portraits/women/12.jpg',
    'https://randomuser.me/api/portraits/men/85.jpg',
  ];

  final List<Map<String, String>> posts = [
    {
      'username': 'mrbeast',
      'description': 'Chris Hemsworth and me!',
      'imageUrl': 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d'
    },
    {
      'username': 'stock_sna',
      'description': 'Exploring new places!',
      'imageUrl': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1'
    },
    {
      'username': 'naturelover',
      'description': 'A beautiful sunset!',
      'imageUrl': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2'
    },
    {
      'username': 'foodie',
      'description': 'Delicious food to try!',
      'imageUrl': 'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.black,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('HamUp',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
                SidebarButton(icon: Icons.home, label: 'Home'),
                SidebarButton(icon: Icons.search, label: 'Search'),
                SidebarButton(icon: Icons.explore, label: 'Explore'),
                SidebarButton(icon: Icons.video_library, label: 'Reels'),
                SidebarButton(icon: Icons.message, label: 'Messages'),
                SidebarButton(
                    icon: Icons.notifications, label: 'Notifications'),
                SidebarButton(icon: Icons.add_box, label: 'Create'),
                SidebarButton(icon: Icons.person, label: 'Profile'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storyImages.length,
                    itemBuilder: (context, index) {
                      return storyAvatar(storyImages[index]);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return postItem(
                          posts[index]['imageUrl']!,
                          posts[index]['username']!,
                          posts[index]['description']!);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  title: Text('amirho33in.real',
                      style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('AMIRHOS3IN', style: TextStyle(color: Colors.grey)),
                  trailing:
                      Text('Switch', style: TextStyle(color: Colors.blue)),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Suggested for you',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(height: 10),
                suggestionItem('tamna.prvtt', 'Suggested for you'),
                suggestionItem('amir.jaj', 'Suggested for you'),
                suggestionItem('hyta.losantos019', 'Suggested for you'),
                suggestionItem('farshad.1385', 'Followed by monx.c'),
                suggestionItem('ruptaur3941', 'Suggested for you'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SidebarButton({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget storyAvatar(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 5),
          const Text(
            'User',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget postItem(String imageUrl, String username, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(username, style: const TextStyle(color: Colors.white)),
          subtitle:
              Text(description, style: const TextStyle(color: Colors.grey)),
        ),
        Image.network(imageUrl),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.comment, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.share, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget suggestionItem(String username, String subtitle) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage:
            NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
      ),
      title: Text(username, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: const Text('Follow', style: TextStyle(color: Colors.blue)),
    );
  }
}
