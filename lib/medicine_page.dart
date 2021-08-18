import 'package:flutter/material.dart';

/*

This file will host all of the following:

  - the Medicine Page Scaffold including the body and floating action button
  - All of the Cards
  - The card building class
  - The page opened when a medicine card is clicked (Detailed Medicine)

 */


class MedicinePage extends StatefulWidget {
  const MedicinePage({
    Key? key,
    required this.medicines
  }) : super(key: key);

  final List<Widget> medicines;

  @override
  _MedicinePageState createState() => _MedicinePageState(meds: medicines);
}

class _MedicinePageState extends State<MedicinePage> {
  List<Widget> meds;

  _MedicinePageState({required this.meds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: meds,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() =>
          meds.add(MedicineCard(name: "Alleve", dosage: "1 Pill", separation: "12 hr")))
      ),
    );
  }
}



class MedicineCard extends StatelessWidget {
  const MedicineCard({
    Key? key,
    required this.name,
    required this.dosage,
    required this.separation,
  }) : super(key: key);

  final String name;
  final String dosage;
  final String separation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(name),
            subtitle: Text("Dosage size: $dosage    Time Between Doses: $separation"),
          ),
        ],
      ),
    );
  }
}
