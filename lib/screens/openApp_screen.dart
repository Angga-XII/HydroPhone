import 'package:flutter/material.dart';
import 'package:hydrophone/screens/loading_screen.dart';
import 'package:hydrophone/functionality/constant.dart';
import 'package:hydrophone/functionality/networking.dart';

class OpeningScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OpeningScreenState();
  }
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kInactiveCardColour,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HydroPhone',
                  style: kNumberTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'by',
                  style: kDateTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'angga',
                  style: kDateTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'efraim',
                  style: kDateTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'fikr',
                  style: kDateTextStyle,
                ),
                IconButton(
                    icon: Icon(Icons.play_circle_filled),
                    iconSize: 100,
                    color: kContainerColour,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoadingScreen();
                          },
                        ),
                      );
                      //networkHelper.parseData();
                    })
              ],
            ),
          )),
    );
  }
}

NetworkHelper networkHelper = NetworkHelper();
