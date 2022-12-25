import 'package:employee/pages/getEmployee.dart';
import 'package:employee/pages/registerEmployee.dart';
import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Management"),
      ),
      body: const Center(
        child: Text("Welcome to Employee Detail"),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Employee Management'),
          ),
          ListTile(
            title: const Text("Register Employee"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  RegisterEmployee()));
            },
          ),
          ListTile(
            title: const Text("Get All Employee"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetEmployee()));
            },
          ),
        ],
      )),
    );
  }
}

// class Employee extends StatelessWidget {
//   const Employee({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: _iconButton,
//           icon: const Icon(Icons.menu),
//           tooltip: "Employee Detail",
//         ),
//         title: const Text("Employee Detail"),
//         actions: <Widget>[
//           IconButton(
//             onPressed: _iconSearch,
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//       body: const Center(
//         child: Text('Welcome to Employee Detail'),
//       ),
//     );
//   }
//
//   void _iconButton() {
//     print("Icon Menu Button Pressed");
//   }
//
//   void _iconSearch() {
//     print("Icon Search Button Pressed");
//   }
// }
