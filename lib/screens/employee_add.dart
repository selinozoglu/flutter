import 'package:flutter/material.dart';

import '../models/employee.dart';

class EmployeeAdd extends StatefulWidget {
  late List<Employee> employeeList;

  EmployeeAdd(this.employeeList);

  @override
  State<StatefulWidget> createState() {
    return _EmployeeAddState(employeeList);
  }
}

class _EmployeeAddState extends State {
  late List<Employee> employeeList;
  var employee = Employee.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _EmployeeAddState(this.employeeList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Employee'),
      ),
      body: Container(
          margin: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Employee Name', hintText: 'Name'),
                  onSaved:(value){
                    employee.name = value!;
                  }
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Employee Surname', hintText: 'Surname'),
                  onSaved: (value) {
                    employee.surname = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Employee Level', hintText: 'Level'),
                  onSaved: (value) {
                    employee.level = int.parse(value!);
                  },
                ),
                saveButton(),
              ],
            ),
          )),
    );
  }

  Widget saveButton() {
    return RaisedButton(
        child: const Text('Save'), onPressed: (){
          formKey.currentState?.save();
          employeeList.add(employee);
    });
  }
}
