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

void main() => runApp(HomePage(medicinePage: MedicinePage(
  medicines: [
    MedicineCard(name: "Tylenol", dosage: "2 pills", separation: "6 hr"),
    MedicineCard(name: 'Ibuprofen', dosage: "2 Pills", separation: "6 hr"),
    MedicineCard(name: "NyQuil", dosage: "30 ml", separation: "4 hr")
  ],
  ))
);

class HomePage extends StatelessWidget {
  /*
  This class is the app structure, it takes arguments for the bodies of each
  page (eventually)
   */
  const HomePage({
    Key? key,
    required this.medicinePage
  }) : super(key: key);

  final medicinePage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Medicine Tracker"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_hospital_outlined)),
                Tab(icon: Icon(Icons.accessibility)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              medicinePage,
              Icon(Icons.accessibility)
            ],
          ),
        ),
      ),
    );
  }
}

class PersonOrMeds extends StatelessWidget {
  /* This will eventually be a clickable card widget that will show the
     following information:

    For a Person:
      - Picture (or initials if a picture isn't provided)
      - Name
      - How many meds they have
      - When the next time a dosage is

    For a Medicine:
      - Picture (or initials if a picture isn't provided)
      - Name
      - Dosage Size (or a "By Weight" toggle)
      - Time between dosages

    - Each card will have a 3 dots button to edit or delete
    - The card will be added after the flacbtn is pressed and the form is filled
    out
   */
  const PersonOrMeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Jorden",
            style: TextStyle(
              fontFamily: "SpaceMono",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Row(
            children: <Widget>[
              Text("5 Medications", style: TextStyle(fontFamily: "SpaceMono"),),
              Text("8:00 p.m.", style: TextStyle(fontFamily: "SpaceMono"),),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
      ),
    );
  }
}

class DetPerson extends StatelessWidget {
  /* This will probably be a stateful widget and will show the following
     information when a persons name is clicked in the home screen:
      - It will have an app bar with the persons name and a navigation arrow
      - Age, Sex, and Weight on one card
      - Each medication they have added to them on individual cards
        - Any medication dosage size can be modified, and a "By Weight"
          dosage will be required to have a specified dosage
      - Each card will have a 3 dots button to bring up edit and delete options
   */
  const DetPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DetMeds extends StatelessWidget {
  /* This will show what medicines are in the medicine and if they "by weight"
     toggle is switched, a sliding dosage scale.
   */
  const DetMeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



