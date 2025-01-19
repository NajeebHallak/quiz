import 'package:flutter/material.dart';
import '../widgets/home_page_app_bar.dart';
import '../widgets/home_page_body.dart';
import '../widgets/home_page_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      drawer: const HomePageDrawer(),
      body: const HomePageBody(),
    );
  }
}
