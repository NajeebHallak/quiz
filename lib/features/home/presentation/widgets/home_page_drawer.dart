import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:quiz/core/routers/app_page_name.dart';
import 'package:quiz/core/utils/constans.dart';
import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Box<CreatOrLoginUserEntites> box =
        Hive.box<CreatOrLoginUserEntites>(Constans.boxCreatAndLoginUser);
    Box<String> boxResultDate = Hive.box(Constans.boxResultsDate);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Your Name'),
            accountEmail: Text('youremail@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/photo_2024-12-17_02-38-16.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              box.clear();
              boxResultDate.clear();
              context.go(AppPageName.loginPage);
            },
          ),
        ],
      ),
    );
  }
}
