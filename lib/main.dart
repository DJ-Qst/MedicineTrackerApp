import 'package:flutter/material.dart';
import 'medicine_page.dart';

/*
  This file wil only hold the "Home Page" and runApp() command (hopefully)
*/

/*
  This project will work like this:
  1. Home will be ran and will boot up the appbar, appbar navigation
  2. Under home will be two pages Medicine and People
  3. Each of those pages will have a floating action button that creates cards
     for the medicines and people
  4. The Cards on each page will be editable and clickable
  5. When a card is clicked it will bring up more detailed information that is
     also editable and a navigation arrow will be added to the appbar
  6. Floating action buttons will bring up a "Form" page requesting information
  7. The form page will not have a app bar, but will slide up from the bottom
     with a rounded square top and "cancel/done" buttons will be at the bottom
  8. The form will return data that is used to create the card
*/

void main() => runApp(Structure(
  medsList: [
    {"name":"Tylenol", "dosage":"2 Pills", "separation":"6 hr", "alive": true},
    {"name":"Ibuprofin", "dosage":"2 Pills", "separation":"6 hr", "alive": true},
    {"name":"NyQuil", "dosage":"30 ml", "separation":"4 hr", "alive": true},
  ]

));

class Structure extends StatefulWidget {
  const Structure({Key? key, required this.medsList}) : super(key: key);

  final List<Map> medsList;

  @override
  _StructureState createState() => _StructureState(meds: medsList);
}

class _StructureState extends State<Structure> {
  List<Map> meds;
  _StructureState({required this.meds});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Make a theme for the app
      // theme: ThemeData(),
      home: DefaultTabController(
        // This TabController is voodoo magic that makes the tabBar work
        length: 2,
        child: Scaffold(
          // Scaffold holds the app with the appBar, tabBar, Body, and FAB
          appBar: AppBar(
            title: Text("Medicine Tracker"),
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
              Icon(Icons.accessibility)]  // People Tab
          ),

          // TODO: Make FAB give options for which form to pick
          floatingActionButton: FloatingActionButton(
            // Floating action button that will give the options for creating medicine or people
            onPressed: () => setState(() {
              meds.add({"name": "Aleve", "dosage": "1 Pill", "separation": "12 hr", "alive": true});
              print("Number of Medicines: ${meds.length}");
          }),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
