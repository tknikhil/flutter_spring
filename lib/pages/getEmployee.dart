import 'dart:convert';

import 'package:employee/model/EmployeeModel.dart';
import 'package:employee/pages/deleteEmployee.dart';
import 'package:employee/pages/employee.dart';
import 'package:employee/pages/updateEmployee.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetEmployee extends StatefulWidget {
  const GetEmployee({Key? key}) : super(key: key);

  @override
  State<GetEmployee> createState() => _GetEmployeeState();
}

class _GetEmployeeState extends State<GetEmployee> {
  var employees = List<EmployeeModel?>.generate(200, (index) => null,);

  Future<List<EmployeeModel>> GetEmployee() async {
    var data = await http.get('http://localhost:8080/getallemployees');
    var jsonData = json.decode(data.body);
    List<EmployeeModel> employees = [];
    for (var e in jsonData) {
      EmployeeModel employeeModel = EmployeeModel();
      employeeModel.id = e["id"];
      employeeModel.firstname = e["firstname"];
      employeeModel.lastname = e["lastname"];
      employees.add(employeeModel);
    }
    return employees;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Employee Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Employee()));
          },
        ),
      ),

      body: Container(
        child: FutureBuilder(future: GetEmployee(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Icon(Icons.error),),);
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: const Text(
                        'ID' + '' + 'FIRSTNAME' + '' + 'LASTNAME'
                    ),
                    subtitle: Text(
                        '${snapshot.data[index].id}' +
                            '${snapshot.data[index].firstname}' +
                            '${snapshot.data[index].lastname}'
                    ),
                    onTap: () {

                    },
                  );
                });
          },
        ),
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  EmployeeModel? employeeModel;
  String fname=EmployeeModel().firstname as String;
  String lname=EmployeeModel().lastname as String;

  DetailPage({Key? key, this.employeeModel}) : super(key: key);

  deleteEmployee1(EmployeeModel employee) async {
    final url = Uri.parse('http://localhost:8080/removeemployee');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(employee);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(fname), actions: <Widget>[
      IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateEmployee()));
      }, icon: Icon(Icons.edit, color: Colors.white,))
    ],
    ),
      body: Container(
        child: Text('FirstName'+' '+fname+' '+'LastName'+lname),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            deleteEmployee1(employeeModel!);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteEmployee()));
          },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
