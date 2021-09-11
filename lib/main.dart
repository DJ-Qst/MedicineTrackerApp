// Different Pages
import 'medicine_page.dart';
import 'sub_pages.dart';

// Dependencies
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

/*
How it works:
  - The Structure() is stateful so it can update with new anything
  - The medicine page is also stateful so I can make changes to it directly
  - If I call set state on either, it rebuilds the app to look properly
 */

void main() => runApp(MaterialApp(
      //TODO: Make a theme for the app
      // theme: ThemeData()
      home: App(medsList: [
        {"name": "Tylenol", "dosage": "2 Pills", "separation": "6 hr"},
        {"name": "Ibuprofin", "dosage": "2 Pills", "separation": "6 hr"},
        {"name": "NyQuil", "dosage": "30 ml", "separation": "4 hr"},
      ]),
    ));

// TODO: Read and Write list of Maps to a file for saving and loading medicines

class App extends StatefulWidget {
  const App({Key? key, required this.medsList}) : super(key: key);

  final List<Map> medsList;

  @override
  _AppState createState() => _AppState(meds: medsList);
}

class _AppState extends State<App> {
  List<Map> meds;
  _AppState({required this.meds});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // This TabController is voodoo magic that makes the tabBar work
      length: 2,
      child: Scaffold(
        // Scaffold holds the entire app including the appBar, tabBar, Body, and FAB
        appBar: AppBar(
          // TODO: Add settings button and have settings page
          title: Text("Medicine Tracker"),
          actions: <Widget>[
            // List of widgets for actions in the appBar
            // Settings Page button
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Settings Button Clicked!"),
                  duration: Duration(seconds: 1),
                ));
              },
              icon: Icon(Icons.settings),
              tooltip: "Open Settings",
            )
          ],
          bottom: const TabBar(
            // At the bottom of the AppBar there is two icons showing the tabs of the app, very positional
            tabs: [
              Tab(icon: Icon(Icons.local_hospital_outlined)), // Medicine Tab
              Tab(icon: Icon(Icons.accessibility)), // People Tab
            ],
          ),
        ),

        body: TabBarView(
            // The Pages for each of the tabs, also very positional
            children: [
              MedicinePage(medicines: meds), // Medicine Tab
              Icon(Icons.accessibility)
            ] // People Tab
            ),

        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          overlayOpacity: 0,
          curve: Curves.easeIn,
          children: [
            SpeedDialChild(
                child: Icon(Icons.person_add),
                label: "Add Person",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PersonForm();
                  }));
                }),
            SpeedDialChild(
                child: Icon(Icons.healing),
                label: "Add Medicine",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MedicineForm();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
