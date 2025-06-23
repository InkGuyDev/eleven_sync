import 'package:eleven_sync/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Appdata extends ChangeNotifier {
  TabBar tabBar() {
    return TabBar(
      tabs: const <Widget>[Tab(text: 'Home'), Tab(text: 'Gallery')],
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      children: <Widget>[
        const Center(child: HomeScreen(title: 'Home')),
        Center(child: HomeScreen(title: 'Home')),
      ],
    );
  }
}
