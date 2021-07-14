import 'package:flutter/material.dart';

AppBar customAppbar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.chevron_left_outlined,
        color: Theme.of(context).backgroundColor,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    backgroundColor: Color(0xFF3490A3),
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
  );
}
