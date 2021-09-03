import 'package:flutter/material.dart';
import 'medicine_page.dart';

/*
How it works:
  - The Structure() is stateful so it can update with new anything
  - The medicine page is also stateful so I can make changes to it directly
  - If I call set state on either, it rebuilds the app to look properly
 */

void main() => runApp(App(medsList: [
      {"name": "Tylenol", "dosage": "2 Pills", "separation": "6 hr"},
      {"name": "Ibuprofin", "dosage": "2 Pills", "separation": "6 hr"},
      {"name": "NyQuil", "dosage": "30 ml", "separation": "4 hr"},
    ]));

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
    return MaterialApp(
      // TODO: Make a theme for the app
      // theme: ThemeData(),
      home: DefaultTabController(
        // This TabController is voodoo magic that makes the tabBar work
        length: 2,
        child: Scaffold(
          // Scaffold holds the entire app including the appBar, tabBar, Body, and FAB
          appBar: AppBar(
            // TODO: Add settings button and have settings page
            title: Text("Medicine Tracker"),
            actions: <Widget>[  // List of widgets for actions in the appBar
              // Settings Page button
              IconButton(
                onPressed: () {print("Settings Button Clicked!");},
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

          // TODO: Make FAB give options for which form to pick
          floatingActionButton: FloatingActionButton(
            // Floating action button that will give the options for creating medicine or people
            onPressed: () => setState(() {
              meds.add({
                "name": "Aleve",
                "dosage": "1 Pill",
                "separation": "12 hr",
                "alive": true
              });
              print("Number of Medicines: ${meds.length}");
            }),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
