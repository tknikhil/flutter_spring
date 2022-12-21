import 'package:flutter/material.dart';

class GetEmployee extends StatefulWidget {
  const GetEmployee({Key? key}) : super(key: key);

  @override
  State<GetEmployee> createState() => _GetEmployeeState();
}

class _GetEmployeeState extends State<GetEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("All Employee Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
    );
  }
}
