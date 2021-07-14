// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_sticker/modals/InstallStickersModal.dart';
import 'package:wa_sticker/modals/StickerListModal.dart';
import 'package:wa_sticker/screens/HomeScreen.dart';
import 'package:wa_sticker/screens/about_us_screen.dart';
import 'package:wa_sticker/screens/follow_us_screen.dart';
import 'package:wa_sticker/screens/reach_us_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StickerListModel()),
        ChangeNotifierProvider(create: (_) => InstallStickersModal()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        title: 'WA stickers',
        theme: ThemeData(
          primaryColor: Color(0xFF3490A3),
          backgroundColor: Color(0xFFE3E3E3),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          FollowUsScreen.id: (context) => FollowUsScreen(),
          ReachUsScreen.id: (context) => ReachUsScreen(),
          AboutUsScreen.id: (context) => AboutUsScreen(),
        },
      ),
    );
  }
}
