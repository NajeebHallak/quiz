import 'package:flutter/material.dart';

class HomePageAppBar extends AppBar {
  HomePageAppBar({
    super.key,
  }) : super(leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ));
}
