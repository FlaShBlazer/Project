import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/recorder.dart';

void main() {
  runApp(MyApp());
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  StaggeredTile.extent(2, 150.0),
  StaggeredTile.extent(1, 250.0),
  StaggeredTile.extent(1, 150.0),
  StaggeredTile.extent(1, 150.0),
  StaggeredTile.extent(1, 150.0),
  StaggeredTile.extent(1, 150.0),
  StaggeredTile.extent(2, 200.0),
  StaggeredTile.extent(2, 150.0),
];
List<Widget> _tiles = <Widget>[
  MyItems(Icons.graphic_eq, "A", 0xffed622b, new Recorder1()),
  MyItems(Icons.graphic_eq, "B", 0xffed622b, ""),
  MyItems(Icons.graphic_eq, "C", 0xffed622b, " "),
  MyItems(Icons.graphic_eq, "D", 0xffed622b, " "),
  MyItems(Icons.graphic_eq, "E", 0xffed622b, " "),
  MyItems(Icons.graphic_eq, "F", 0xffed622b, " "),
  MyItems(Icons.graphic_eq, "G", 0xffed622b, " "),
  MyItems(Icons.graphic_eq, "H", 0xffed622b, " "),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/record': (BuildContext context) => new Recorder1()
      },
      home: new Dashboard(),
    );
  }
}

class MyItems extends StatelessWidget {
  MyItems(this.icon, this.heading, this.color, this.routeName);

  final int color;
  final IconData icon;
  final String heading;
  final Object routeName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      elevation: 14.0,
      shadowColor: Colors.black87,
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    heading,
                    style: TextStyle(color: new Color(color), fontSize: 20.0),
                  ),
                ),
                Material(
                  color: new Color(color),
                  borderRadius: BorderRadius.circular(24.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      icon: Icon(icon),
                      color: Colors.white,
                      iconSize: 20.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => routeName));
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        staggeredTiles: _staggeredTiles,
        children: _tiles,
      ),
    );
  }
}
