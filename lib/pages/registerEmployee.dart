import 'package:flutter/material.dart';

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({Key? key}) : super(key: key);

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final minimumpadding = 5.2;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

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
            ElevatedButton(onPressed: () {}, child:const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
