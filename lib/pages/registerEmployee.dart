import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/EmployeeModel.dart';

class RegisterEmployee extends StatefulWidget {
  // const RegisterEmployee(String firstName, String lastName, BuildContext context, {Key? key}) : super(key: key);

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
}

Future<EmployeeModel> registerEmployee(
    String firstname, String lastname, BuildContext context) async {
  var Url = "http://10.0.2.2:8080/addemployee";
  var response = await http.post(Url,
      headers: <String, String>{"Content-type": "application/json"},
      body: jsonEncode(
          <String, String>{"firstname": firstname, "lastname": lastname}));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend response', content: response.body);
      },
    );
  }

  throw Exception();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final minimumpadding = 5.2;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  late EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Employee"),
      ),
      body: Padding(
        padding: EdgeInsets.all(minimumpadding * 2),
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: minimumpadding, bottom: minimumpadding),
                child: TextFormField(
                  style: textStyle,
                  controller: firstController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your name!";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter your first Name!',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: minimumpadding, bottom: minimumpadding),
                child: TextFormField(
                  style: textStyle,
                  controller: secondController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your name!";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter your Last Name!',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            //RaisedButton is depricated
            ElevatedButton(child: Text('Submit'),
    onPressed: () async {
    String? firstName = firstController.text;
    String? lastName = secondController.text;
    EmployeeModel employees =
    await registerEmployee(firstName, lastName, context);
    firstController.text = '';
    secondController.text = '';
    setState(() {
    employee = employees;});})
          ],
        ),
      ),
    );
  }
}


class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget>actions;

  const MyAlertDialog({Key? key,this.actions=const[], required this.content, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title:  Text(title,style:  Theme.of(context).textTheme.titleMedium,),
      actions: actions,
      content: Text(content,style: Theme.of(context).textTheme.bodyMedium ,),
    );
  }
}
