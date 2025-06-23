import 'package:flutter/material.dart';
import 'package:eleven_sync/pages/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:eleven_sync/widgets/app_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Appdata())],
      child: const MyApp(),
    ),
  );
}
