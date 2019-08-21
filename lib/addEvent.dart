import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class AddEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add Event';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: AddEventForm(),
      ),
    );
  }
}

// Create a Form widget.
class AddEventForm extends StatefulWidget {
  @override
  AddEventFormState createState() {
    return AddEventFormState();
  }
}

class AddEventFormState extends State<AddEventForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<AddEventFormState>.
  final _formKey = GlobalKey<FormState>();
  final testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: testController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false
                // otherwise.
                
              },
              child: Text('Submits'),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // Retrieve the text the user has entered by using the
        // TextEditingController.
        content: Container(
          width: double.maxFinite,
          child: StreamBuilder(
            stream: Firestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              final jsonEncoder = JsonEncoder();
              if(!snapshot.hasData) return Text('Loading...');
              // snapshot.data.documents[0]['name']
              print(snapshot.data.documents[0]['eventName']);
              return Text(snapshot.data.documents[0]['eventName']);
            }
          ),
        ),
      );
    },
  );
 */