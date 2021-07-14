import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:wa_sticker/utils/utils.dart';

class StickerPackInformation extends StatefulWidget {
  final List stickerPack;

  StickerPackInformation(this.stickerPack);
  @override
  _StickerPackInformationState createState() =>
      _StickerPackInformationState(stickerPack);
}

class _StickerPackInformationState extends State<StickerPackInformation> {
  List stickerPack;
  final WhatsAppStickers _waStickers = WhatsAppStickers();

  _StickerPackInformationState(this.stickerPack); //constructor

  void _checkInstallationStatuses() async {
    print("Total Stickers : ${stickerPack.length}");
    var tempName = stickerPack[0];
    bool tempInstall =
        await WhatsAppStickers().isStickerPackInstalled(tempName);

    if (tempInstall == true) {
      if (!stickerPack[6].contains(tempName)) {
        setState(() {
          stickerPack[6].add(tempName);
        });
      }
    } else {
      if (stickerPack[6].contains(tempName)) {
        setState(() {
          stickerPack[6].remove(tempName);
        });
      }
    }
    print("${stickerPack[6]}");
  }

  @override
  Widget build(BuildContext context) {
    List totalStickers = stickerPack[4];
    // List<Widget> fakeBottomButtons = new List<Widget>();
    // fakeBottomButtons.add(
    //   Container(
    //     height: 50.0,
    //   ),
    // );
    Widget depInstallWidget;
    if (stickerPack[5] == true) {
      depInstallWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Sticker pack added to Whatsapp",
          style: TextStyle(
              color: Colors.green, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      depInstallWidget = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.11,
          child: FlatButton(
            color: Color(0xff1BD741),
            onPressed: () async {
              _waStickers.addStickerPack(
                  packageName: WhatsAppPackage.Consumer,
                  stickerPackIdentifier: stickerPack[0],
                  stickerPackName: stickerPack[1],
                  listener: (action, result, {error = 'hi'}) => processResponse(
                      action: action,
                      result: result,
                      error: error,
                      context: context,
                      successCallback: () async {
                        setState(() {
                          _checkInstallationStatuses();
                        });
                      }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/whatsapp.png',
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Text(
                  'ADD TO WHATSAPP',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "sticker_packs/${stickerPack[0]}/${stickerPack[3]}",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${stickerPack[1]}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'MemeXD',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        // Text(
                        //   "${stickerPack[2]}",
                        //   style: TextStyle(
                        //     fontSize: 14.0,
                        //     color: Colors.black54,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: totalStickers.length,
                    itemBuilder: (context, index) {
                      var stickerImg =
                          "sticker_packs/${stickerPack[0]}/${totalStickers[index]['image_file']}";
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          stickerImg,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      );
                    }),
              ),
            ),
            depInstallWidget,
            stickerPack[5] == true
                ? Container()
                : Text(
                    'Tap to preview sticker',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
