import 'dart:convert';

EmployeeModel employeeModelJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToString(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  int? id;
  String? firstname;
  String? lastname;

  EmployeeModel(
      { this.id,  this.firstname,  this.lastname});

  factory EmployeeModel.fromJson(Map<String?, dynamic?> json) => EmployeeModel(
      id: json?["id"], firstname: json?["firstname"], lastname: json?["lastname"]);

  Map<String?, dynamic?> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
      };

  String? get firstName => firstname;

  String? get lastName => lastname;
}
