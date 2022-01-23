import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/models/user.dart' as model;
import 'package:insta_clone/providers/user_provider.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        children: [
          Text('Home'),
          Text('Profile'),
          Text('Search'),
          Text('Notifications'),
        ],
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (int page) {
          setState(() {
            _page = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: mobileBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor),
            label: 'Search',
            backgroundColor: mobileBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box,
                color: _page == 2 ? primaryColor : secondaryColor),
            label: 'Upload',
            backgroundColor: mobileBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border,
                color: _page == 3 ? primaryColor : secondaryColor),
            label: 'Likes',
            backgroundColor: mobileBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _page == 4 ? primaryColor : secondaryColor),
            label: 'Profile',
            backgroundColor: mobileBackgroundColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
