import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'file:///E:/Kuliah/misc/AndroidStudioApp/Hydroponic-flutter/lib/funcionality/constant.dart';
import 'dataPage_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    changePage();
  }

  void changePage() async {
    var liveData = await networkHelper.parseData();
    updateData(liveData);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return DataPage(
              tempData: temp,
              tdsData: tds,
              flowData: flow,
              dateData: date,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveCardColour,
      body: Center(
        child: SpinKitDoubleBounce(
          color: kActiveCardColour,
          size: 100.0,
        ),
      ),
    );
  }
}
