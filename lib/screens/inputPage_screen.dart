import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../functionality/constant.dart';
import 'package:hydrophone/screens/dataPage_screen.dart';

enum States { on, off }
States selectedState;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int flowRate = flow * 100 ~/ 1.8;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColour,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appCard(
              kInactiveCardColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Set Flow Speed',
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'Max = 1.8 L/minutes',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    flowRate.toString(),
                    style: kNumberTextStyle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kContainerColour,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: flowRate.toDouble(),
                      min: 0.0,
                      max: 100,
                      onChanged: (double newValue) {
                        setState(() {
                          flowRate = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedState = States.on;
                        datatoSend = 'on';
                      });
                    },
                    child: appCard(
                        selectedState == States.on
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.brightness_7,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              'ON',
                              style: kLabelTextStyle,
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedState = States.off;
                        datatoSend = 'off';
                      });
                    },
                    child: appCard(
                      selectedState == States.off
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.brightness_5,
                            size: 80,
                            color: Colors.white,
                          ),
                          Text(
                            'OFF',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  networkHelper.createAlbum(datatoSend, flowRate);
                });
              },
              child: Icon(
                Icons.send,
                size: 80,
                color: kContainerColour,
              ),
            )
          ],
        ),
      ),
    );
  }
}
