import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../functionality/networking.dart';
import '../functionality/constant.dart';
import 'inputPage_screen.dart';
import 'loading_screen.dart';

class DataPage extends StatefulWidget {
  DataPage({this.tempData, this.tdsData, this.flowData, this.dateData});
  final dynamic tempData;
  final double tdsData;
  final double flowData;
  final String dateData;
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    super.initState();
    temp = widget.tempData;
    tds = widget.tdsData;
    flow = widget.flowData;
    date = widget.dateData.substring(0, 19);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HydroPhone'),
          leading: Icon(Icons.local_florist),
          backgroundColor: kBackgroundColour,
        ),
        backgroundColor: kBackgroundColour,
        body: PageView(
          controller: controller,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: showedData(
                      temp.toStringAsPrecision(2), 'Temperature', 'celcius'),
                ),
                Expanded(
                    child:
                        showedData(tds.toStringAsPrecision(5), 'TDS', 'ppm')),
                Expanded(
                    child: showedData(
                        flow.toStringAsPrecision(2), 'Flow', 'L/menit')),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: appCard(
                        kInactiveCardColour,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Last Updated',
                              style: kDateTitleTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  date.substring(5, 10),
                                  style: kDateTextStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  date.substring(11, 19),
                                  style: kDateTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.autorenew, color: kContainerColour),
                      iconSize: 40.0,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoadingScreen();
                              },
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ), //time
              ],
            ),
            InputPage()
          ],
        ),
      ),
    );
  }
}

NetworkHelper networkHelper = NetworkHelper();

final controller = PageController(initialPage: 0);

dynamic temp;
double tds;
double flow;
String date;
String datatoSend = 'off';
var stateColor;

Container appCard(colour, Widget cardChild) {
  return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild);
}

Container showedData(String data, String name, String label) {
  return appCard(
    kInactiveCardColour,
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$name',
          style: kTitleTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              data,
              style: kNumberTextStyle,
            ),
            Text(
              label,
              style: kLabelTextStyle,
            ),
          ],
        ),
      ],
    ),
  );
}

void updateData(var data) {
  temp = data['results'][0]['series'][0]['values'][0][3];
  tds = data['results'][0]['series'][0]['values'][0][2];
  flow = data['results'][0]['series'][0]['values'][0][1];
  date = data['results'][0]['series'][0]['values'][0][0];
}
