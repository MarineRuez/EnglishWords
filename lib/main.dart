/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    gridWords,
    gridWords2,
    gridWords
  ];
  static const words = [
    ['assets/images/chicken.png', "chicken", "poulet"],
    ['assets/images/pig.png', "pig", "cochon"],
    ['assets/images/cow.png', "cow", "vache"],
  ];

  static Widget title = Text(
    'Farm animals',
    style: TextStyle(
      color: Colors.black,
    ),
  );

  static Widget gridWords = GridView.count(
    crossAxisCount: 2,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    children: List.generate(3, (index) {
      return Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  words[index][0],
                  width: 70,
                ),
              ),
              /*2*/
              Text(
                words[index][1],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                words[index][2],
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }),
  );
  static Widget gridWords2 = GridView.count(
    crossAxisCount: 2,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    children: List.generate(2, (index) {
      return Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  words[index][0],
                  width: 70,
                ),
              ),
              /*2*/
              Text(
                words[index][1],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                words[index][2],
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }),
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('INTERROGE MOI'),
        icon: Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
