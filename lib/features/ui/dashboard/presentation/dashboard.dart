import 'package:adept_labz/features/ui/albums/albums_list.dart';
import 'package:adept_labz/features/ui/posts/post_list.dart';
import 'package:adept_labz/features/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.child});
  final Widget? child;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: selectedTab,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        AlbumList(),
        PostList(),
        ProfilePage(),
      ],
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  String getTitle() {
    switch (pageIndex) {
      case 0:
        return "Albums";
      case 1:
        return "Posts";
      case 2:
        return "Profile";
      default:
        return "Dashboard";
    }
  }
}
