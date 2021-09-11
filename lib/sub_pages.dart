/*
This file will hold all of the following:

  - The form page class with the body and cancel/done buttons
  - Two different forms, one to add a medicine and one to add a person
 */

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class MedicineForm extends StatelessWidget {
  // defaultValue is the blank form
  static const defaultValue = {
    "name": "",
    "dosage": "",
    "separation": "",
    "byWeight": false,
  };
  final Map<String, dynamic> formValues;

  final _medFormKey = GlobalKey<FormBuilderState>();
  MedicineForm({Key? key, this.formValues = defaultValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Medicine"),
        automaticallyImplyLeading: false, // Gets rid of the back arrow
      ),
      body: FormBuilder(
        key: _medFormKey,
        child: Column(
          children: [
            // Text field for the Med Name
            FormBuilderTextField(
              name: "name",
              decoration: InputDecoration(hintText: "Medicine Name"),
              // This value transformer makes each word capitalized
              valueTransformer: (value) {
                return value!
                    .split(' ')
                    .map((word) => word[0].toUpperCase() + word.substring(1))
                    .join(' ');
              },
            ),
            // Cancel and Create buttons
            Row(
              children: [
                // This button Saves nothing and closes the page
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),

                // This button Saves and will create a card ... eventually
                ElevatedButton(
                  onPressed: () {
                    // Unfocuses the keyboard
                    FocusScope.of(context).unfocus();
                    // Saves all input fields to a map
                    _medFormKey.currentState!.save();
                    // Shows snackbar of the saved map
                    final values = _medFormKey.currentState!.value;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$values"),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: Text("Create"),
                ),
              ],
            )
          ],
        ),
        initialValue: formValues,
      ),
    );
  }
}

class PersonForm extends StatelessWidget {
  const PersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Person"),
      ),
      body: Center(
        child: Text("Form Page to Add a New Person"),
      ),
    );
  }
}
