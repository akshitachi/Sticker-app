import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wa_sticker/components/custom_app_bar.dart';

class FollowUsScreen extends StatefulWidget {
  static String get id => 'Follow_Us_Screen';
  @override
  _FollowUsScreenState createState() => _FollowUsScreenState();
}

class _FollowUsScreenState extends State<FollowUsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Follow Us',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                  fontSize: 28,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'What is the one thing common\nbetween God and memeXd? Both are\nomnipresent!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 17,
                  fontFamily: 'Montserrat-Regular',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Follow us on various platforms:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SocialMediaHandles(
                mediaName: 'Facebook',
                assetName: 'facebook_icon',
                url: "https://www.facebook.com/MemexD-106255747869134",
              ),
              SocialMediaHandles(
                mediaName: 'Youtube',
                assetName: 'youtube',
                url:
                    "https://www.youtube.com/channel/UCIcGF9iyOFglTH4VZf51LtQ?view_as=subscriber",
              ),
              SocialMediaHandles(
                mediaName: 'Instagram',
                assetName: 'instagram',
                url: "https://www.instagram.com/xd.memexd/",
              ),
              SocialMediaHandles(
                mediaName: 'Twitter',
                assetName: 'twitter',
                url: "https://twitter.com/Meme__xD",
              ),
              SocialMediaHandles(
                mediaName: 'LinkedIn',
                assetName: 'linkedin',
                url: "https://www.linkedin.com/company/memexd",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Thank You!',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaHandles extends StatelessWidget {
  final String? mediaName;
  final String? assetName;
  final String? url;
  SocialMediaHandles({
    this.mediaName,
    this.assetName,
    this.url,
  });

  Future<void> _launchURL() async => await canLaunch(url!)
      ? await launch(url!)
      : throw 'Could not launch $url';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            mediaName!,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText2!.color,
              fontSize: 23,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: IconButton(
            icon: Image.asset(
              'images/$assetName.png',
            ),
            onPressed: _launchURL,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.013,
        ),
      ],
    );
  }
}
