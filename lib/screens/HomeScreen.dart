import 'package:flutter/material.dart';
import 'package:wa_sticker/screens/StickerList.dart';
import 'package:wa_sticker/screens/about_us_screen.dart';
import 'package:wa_sticker/screens/follow_us_screen.dart';
import 'package:wa_sticker/screens/reach_us_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF3490A3),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.08,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.08,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/memexdlogo.png'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Center(
                child: Text(
                  'MEMEXD',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFE3E3E3),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    letterSpacing: 4,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Center(
            child: Text(
              'Welcome !!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: Text(
              'For Easy Meme Editor and Free Meme Templates',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Center(
            child: Text(
              'Download MemeXD : Xplore and Design',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: MediaQuery.of(context).size.height * 0.0014,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: StickerList(),
          )
        ],
      ),
      persistentFooterButtons: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              FollowUsScreen.id,
            );
          },
          child: Text('Follow Us'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AboutUsScreen.id,
            );
          },
          child: Text('About Us'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ReachUsScreen.id,
            );
          },
          child: Text('Reach Us'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.001,
        ),
      ],
    );
  }
}
