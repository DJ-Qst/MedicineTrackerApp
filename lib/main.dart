import 'package:flutter/material.dart';

void main() => runApp(const Home());

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

class Home extends StatelessWidget {
  /* -This will be the home page with a "Medicine Tracker" Appbar that has two
      sliding options in the app bar "Medicines" and "People"
     - Both pages will have a floating action button to add their data
   */
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
                "Medicine Tracker",
                style: TextStyle(
                  fontFamily: "SpaceMono",
                  color: Colors.black,
                ),
            ),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    children: <Widget>[
                      PersonOrMeds(),
                      Image.asset("assets/images/tylenol.jpg", height: 200, width: 200,)
                    ],
                  )
              ),
            ],
          ),
          
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[900],
          onPressed: () {

          },
          child: Icon(
              Icons.add,
              size: 30,
          ),
        ),
      )
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



