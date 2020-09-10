import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:url_launcher/url_launcher.dart';

class WebFrame extends StatelessWidget {
  final Widget child;

  const WebFrame({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && MediaQuery.of(context).size.width > 600) {
      final date = DateTime.now();
      final MediaQueryData mediaQuery = MediaQueryData(
        size: Size(414, 896),
        padding: EdgeInsets.only(
          top: 44,
          bottom: 34,
        ),
        devicePixelRatio: 2,
      );
      return Material(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 2,
                key: Key('Preview'),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Builder(builder: (context) {
                    final device = MediaQuery(
                      data: mediaQuery,
                      child: Container(
                          width: mediaQuery.size.width,
                          height: mediaQuery.size.height,
                          alignment: Alignment.center,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              child,
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                height: 44,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 4),
                                        child: Text(
                                          '${date.hour}:${date.minute}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(right: 18),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.signal_cellular_4_bar,
                                              size: 14,
                                            ),
                                            SizedBox(width: 4),
                                            Icon(Icons.wifi, size: 16),
                                            SizedBox(width: 4),
                                            Icon(
                                                CupertinoIcons.battery_charging,
                                                size: 20)
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  height: 4,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              )
                            ],
                          )),
                    );

                    return Container(
                      child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(38.5),
                          child: device),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black, width: 12)),
                    );
                  }),
                ),
              ),
              SizedBox(width: 80),
              Flexible(
                  flex: 1,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 40),
                          width: mediaQuery.size.width,
                          height: mediaQuery.size.height,
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Tech Everywhere',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 75,
                                      color: const Color(0xff295eff)),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    // onTap: () => launch(
                                    //     'https://play.google.com/store/apps/details?id=org.dscadmu.admurecweekapp'),
                                    onTap: () => {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Tech Everywhere is not yet available in Google Play Store.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0)
                                    },
                                    child: Image.asset(
                                        'assets/images/play_store.png',
                                        height: 60),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    // onTap: () => launch(
                                    //     'https://apps.apple.com/app/id1529810829'),
                                    onTap: () => {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Tech Everywhere is not yet available in App Store.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0)
                                    },
                                    child: Image.asset(
                                        'assets/images/app_store.png',
                                        height: 60),
                                  ),
                                ],
                              )
                            ],
                          ))))
            ],
          ),
        ),
      );
    } else {
      return child;
    }
  }
}
