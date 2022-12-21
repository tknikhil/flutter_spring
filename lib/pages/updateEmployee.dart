import 'package:flutter/material.dart';

class UpdateEmployee extends StatefulWidget {
  const UpdateEmployee({Key? key}) : super(key: key);

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Employee"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
    );
  }
}
