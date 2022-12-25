import 'dart:convert';

import 'package:employee/pages/getEmployee.dart';
import 'package:flutter/material.dart';

import '../model/EmployeeModel.dart';
import 'package:http/http.dart' as http;
class DeleteEmployee extends StatefulWidget {
  const DeleteEmployee({Key? key}) : super(key: key);

  @override
  State<DeleteEmployee> createState() => _DeleteEmployeeState();
}
Future<EmployeeModel> deleteEmployees(String firstName, String lastName) async {
  var Url = "http://localhost:8080/removeemployee";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  return EmployeeModel.fromJson(jsonDecode(response.body));
}
class _DeleteEmployeeState extends State<DeleteEmployee> {
  @override
  Widget build(BuildContext context) {
    return GetEmployee();
  }
}
