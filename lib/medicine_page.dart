import 'package:flutter/material.dart';

/*
// Function for testing in this file alone
void main() => runApp(MedicinePage(medicines: [
  MedicineCard(name: "Tylenol", dosage: "2 pills", separation: "6 hr"),
  MedicineCard(name: 'Ibuprofen', dosage: "2 Pills", separation: "6 hr"),
  MedicineCard(name: "NyQuil", dosage: "30 ml", separation: "4 hr")]));
*/

/*
    This is the medicine page, it returns a listview.builder and is the body of
    the scaffold on the main page. It is the list of all of the medicines.

    This page updates in two different ways:
      1. when the whole page is rebuilt from the main after the FAB adds a card
      2. When the ListView is updated on a card deletion or card changing
     */

class MedicinePage extends StatefulWidget {
  // Should be a list of dictionaries with a name, dosage and separation
  const MedicinePage({Key? key, required this.medicines}) : super(key: key);

  final List<Map> medicines;

  @override
  _MedicinePage createState() => _MedicinePage(medicines);
}

class _MedicinePage extends State<MedicinePage> {
  List<Map> _meds;

  _MedicinePage(this._meds);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _meds.length, // How long the list is, IDK what its for
        itemBuilder: (BuildContext context, int index) {
          // The itemBuilder takes each Map item and turns it into a card
          return Card(
            child: ListTile(
                // ListTile makes cards look good
                leading: Icon(Icons
                    .favorite), // This will be the medicine picture (if provided)
                title: Text(_meds[index]["name"]),
                subtitle: Text(
                    "Dosage size: ${_meds[index]["dosage"]}\nTime Between Doses: ${_meds[index]["separation"]}"),
                // TODO: Write function that opens card for editing medicine
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Opening the ${_meds[index]["name"]} at index $index for editing"),
                    duration: Duration(seconds: 1),
                  ));
                },
                trailing: PopupMenuButton(
                  // This is the three dot button that will give the delete option, and potentially a specific edit button

                  // The itemBuilder makes buttons for each option I give
                  // When an option is selected the "Value" parameter is returned
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                        value: "delete",
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],

                  // This runs when a value gets returned, and each button has
                  // its own switch case so the correct state can be set
                  onSelected: (value) {
                    switch (value) {
                      case "delete":
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Deleted ${_meds[index]["name"]}. There are ${_meds.length - 1} medicine(s) left"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                          _meds.removeAt(index);
                        });
                        break;
                    }
                  },
                )),
          );
        });
  }
}

// Stuff below this comment is old and is just here for reference

/*
class MedicinePage_DEPRECIATED extends StatelessWidget {
  // This is the medicine page itself, just puts a list of widgets in a ListView
  const MedicinePage({Key? key, required this.medicines}) : super(key: key);
  final List<Widget> medicines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      /* This is a different form of ListView that's more dynamic.
      It's essentially a for loop that builds  each item in a list until it
      eaches the end. */
      itemCount: medicines.length,
      // How far it should go, list.length will do the whole list
      itemBuilder: (BuildContext context, int index) {
        // The for loop
        return medicines[index];
      },
    );
  }
}
*/ // Old MedicinePage

/*
class MedicineCardDepreciated extends StatefulWidget {
  // This is the format for each medicine card, takes name, dosage, and time between doses
  MedicineCardDepreciated({
    Key? key,
    required this.name,
    required this.dosage,
    required this.separation,
  }) : super(key: key);


  final String name;
  final String dosage;
  final String separation;

  @override
  _MedicineCardDepreciatedState createState() => _MedicineCardDepreciatedState(name, dosage, separation);
}

class _MedicineCardDepreciatedState extends State<MedicineCardDepreciated> {
  // All of these are redefined so I can edit them later
  var _alive;
  String _nm;
  String _dos;
  String _sep;

  _MedicineCardDepreciatedState(this._nm, this._dos, this._sep);

  @override
  Widget build(BuildContext context) {
    // Super Hacky solution but the card is stateful and just becomes a sized box thats sized 0
    // when it's deleted
    if(_alive == false){
      return SizedBox(width: 0, height: 0,);
    }
    else {
      return Card(
        child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text(_nm),
            subtitle: Text(
                "Dosage size: $_dos\nTime Between Doses: $_sep"),
            onTap: () {},
            trailing: PopupMenuButton(
              onSelected: (value){
                switch (value){
                  case "delete":
                    setState(() {_alive = false;});
                    break;
                }
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry>[
                PopupMenuItem(
                    value: "delete",
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            )
        ),
      );
    }
  }
}
*/ // Old Medicine Card
