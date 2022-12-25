import 'dart:convert';

import 'package:employee/pages/registerEmployee.dart';
import 'package:flutter/material.dart';

import '../model/EmployeeModel.dart';
import 'employee.dart';
import 'package:http/http.dart'as http;

class UpdateEmployee extends StatefulWidget {
  const UpdateEmployee({Key? key}) : super(key: key);

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}
Future<EmployeeModel> updateEmployees(
    EmployeeModel employee, BuildContext context) async {
  var Url = "http://localhost:8080/updateemployee";
  var response = await http.put(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(employee));
  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: 'Backend Response', content: response.body);
        });
  }
  throw Exception();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  late EmployeeModel employee;
  final minimumPadding = 5.0;
  late TextEditingController employeeNumber;
  bool _isEnabled = false;
  late TextEditingController firstController;
  late TextEditingController lastController;
  late Future<List<EmployeeModel>> employees;
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Employee"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Employee()));
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding*2),
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: minimumPadding,bottom: minimumPadding
              ),
              child:TextFormField(
                style: textStyle,
                controller: employeeNumber,
                enabled: _isEnabled,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'please enter your ID';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Employee ID',
                    hintText: 'Enter Employee ID',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: firstController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your name';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter Your First Name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: minimumPadding, bottom: minimumPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: lastController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your name';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter Your First Name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            ElevatedButton(
                child: Text('Update Details'),
                onPressed: () async {
                  String firstName = firstController.text;
                  String lastName = lastController.text;
                  EmployeeModel emp = EmployeeModel();
                  emp.id = employee.id;
                  emp.firstname = firstController.text;
                  emp.lastname = lastController.text;
                  EmployeeModel employees =
                  await updateEmployees(emp, context);
                  setState(() {
                    employee = employees;
                  });
                })
          ],),
        ),
      ),
    );
  }
}
class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const MyAlertDialog({Key? key,
    required this.title,
    required this.content,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: actions,
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}