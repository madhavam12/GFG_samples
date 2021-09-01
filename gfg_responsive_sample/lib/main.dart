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
        if (dimens.maxWidth < kTabletBreakpoint) {
          return mobileBody;
        } else if (dimens.maxWidth >= kTabletBreakpoint &&
            dimens.maxWidth < kDesktopBreakPoint) {
          return tabletBody ?? mobileBody;
        } else {
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
      appBar:
          screenW <= 600 ? AppBar(title: Text("Will hide on rotating")) : null,
      body: Center(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Demo')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildPortraitContainer();
          }
        },
      ),
    );
  }

  Widget _buildPortraitContainer() {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _buildWideContainers() {
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
