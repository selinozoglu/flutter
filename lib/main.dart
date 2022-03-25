import 'package:flutter/material.dart';
import 'package:flutter_project1/models/employee.dart';
import 'package:flutter_project1/screens/employee_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employees',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Employees'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Employee selectedEmployee = Employee.withId(0,'', '', 0, '');
  List<Employee> employeeList = [
    Employee.withId(1, 'Selin', 'Özoğlu', 1, 'Frontend Developer'),
    Employee.withId(2, 'Ali', 'Duru', 13, 'Fullstack Developer'),
    Employee.withId(3, 'Ece', 'Yılmaz', 18, 'Backend Developer'),
    Employee.withId(4, 'Gökhan', 'Bilen', 5, 'Backend Developer')
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + ' ' + setMeetTitle()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: employeeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                        title: Text(employeeList[index].name +
                            ' ' +
                            employeeList[index].surname),
                        subtitle: Text('Level: ' +
                            employeeList[index].level.toString() +
                            ' ' +
                            employeeList[index].getInfo),
                        trailing: buildStatusIcon(employeeList[index].level),
                        onTap: () {
                          setState(() {
                            selectedEmployee = employeeList[index];
                          });
                        });
                  })),

          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.lime,
                  child: Row(
                    children: [Text('add'), Icon(Icons.add_circle_outline)],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeAdd(employeeList)))
                        .then((value){
                          setState(() {
                          });
                    });
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(
                    children: [Text('update'), Icon(Icons.update_outlined)],
                  ),
                  onPressed: () {
                    print('update');
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: Row(
                    children: [Text('delete'), Icon(Icons.highlight_remove)],
                  ),
                  onPressed: () {
                    setState(() {
                      employeeList.remove(selectedEmployee);
                    });
                    var alert = AlertDialog(
                        title: Text('Result'), content: Text('Deleted'));
                    showDialog(context: context, builder: (context) => alert);

                  },
                ),
              ),
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildStatusIcon(int level) {
    if (level > 10) {
      return Icon(Icons.check_circle_outline);
    } else {
      return Icon(Icons.access_time_outlined);
    }
  }
}

String setMeetTitle() {
  DateTime now = new DateTime.now();
  int hour = now.hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Day';
  } else {
    return 'Good Evening';
  }
}
