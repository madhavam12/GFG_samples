import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQueryExample(),
    );
  }
}

const kTabletBreakpoint = 768.0;
const kDesktopBreakPoint = 1440.0;

const kSideMenuWidth = 300.0;
const kNavigationRailWidth = 72.0;

const kMaxWidth = 1180.0;

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        //check if the device is a phone
        if (dimens.maxWidth < kTabletBreakpoint) {
          return mobileBody;
        } else if (dimens.maxWidth >= kTabletBreakpoint &&
            dimens.maxWidth < kDesktopBreakPoint) {
          //returns mobileBody if tabletBody is null
          return tabletBody ?? mobileBody;
        } else {
          //returns mobileBody if desktopBody is null
          return desktopBody ?? mobileBody;
        }
      },
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    print(screenW);

    return Scaffold(
      //when screen's width is less than 600px, it shows a appbar, when it's over 600px, ithides it.
      appBar: screenW <= 600
          ? AppBar(
              title: Text("Geeks for Geeks"), backgroundColor: Colors.green)
          : null,
      body: Center(
        child: Text("Mediaquery example"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Geeks for Geeks"), backgroundColor: Colors.green),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //constraints provide us with maxWidth,maxHeight etc, using
          //which we can show different widgets accordingly
          if (constraints.maxWidth > 600) {
            //as the width is greater than 600px, we'll show wide screen container
            return _buildWideScreenContainers();
          } else {
            return _buildPortraitContainer();
          }
        },
      ),
    );
  }

  Widget _buildPortraitContainer() {
//here we're returning a single container since the phone
//doesn't have the required width (600px)
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _buildWideScreenContainers() {
//here we're returning double containers since the phone
// have the required width (600px)
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
