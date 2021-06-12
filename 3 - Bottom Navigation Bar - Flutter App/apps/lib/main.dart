
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<GButton> tabs = [];
  List<Color> colors = [
    Colors.lightGreenAccent,
    Colors.pink[200]!,
    Colors.amber[200]!,
    Colors.lightBlue[200]!
  ];

  static List<Color> textColoring = [
    Colors.lightGreen[900]!,
    Colors.pink[800]!,
    Colors.amber[900]!,
    Colors.blue[900]!,
  ];
  List<Widget> appbarText = <Widget>[
    Text(
      'Home',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[0],
      ),
    ),
    Text(
      'Shop',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[1],
      ),
    ),
    Text(
      'Blog',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[2],
      ),
    ),
    Text(
      'Profile',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[3],
      ),
    ),
  ];

  List<Widget> centerText = <Widget>[
    Text(
      'Welcome to Home',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[0],
      ),
    ),
    Text(
      'Welcome to Shop',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[1],
      ),
    ),
    Text(
      'Welcome to Blog',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[2],
      ),
    ),
    Text(
      'Welcome to Profile',
      style: TextStyle(
        fontSize: 30.0,
        color: textColoring[3],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _tabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarText[selectedIndex],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        color: colors[selectedIndex],
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 275.0),
                child: centerText[selectedIndex],
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 14),
                  child: GNav(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    duration: Duration(milliseconds: 800),
                    gap: 8.5,
                    tabs: [
                      GButton(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: textColoring[0],
                        ),
                        iconActiveColor: textColoring[0],
                        iconColor: Colors.black,
                        backgroundColor: Colors.lightGreenAccent,
                        iconSize: 30,
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: textColoring[1],
                        ),
                        iconActiveColor: textColoring[1],
                        iconColor: Colors.black,
                        backgroundColor: Colors.pink[200],
                        iconSize: 30,
                        icon: LineIcons.shoppingBag,
                        text: 'Shop',
                      ),
                      GButton(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: textColoring[2],
                        ),
                        iconActiveColor: textColoring[2],
                        iconColor: Colors.black,
                        backgroundColor: Colors.amber[200],
                        iconSize: 30,
                        icon: LineIcons.bookOpen,
                        text: 'Blog',
                      ),
                      GButton(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: textColoring[3],
                        ),
                        iconActiveColor: textColoring[3],
                        iconColor: Colors.black,
                        backgroundColor: Colors.lightBlue[200]!,
                        iconSize: 30,
                        icon: LineIcons.user,
                        text: 'Profile',
                      )
                    ],
                    selectedIndex: selectedIndex,
                    onTabChange: _tabChanged,
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