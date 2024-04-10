import 'package:flutter/material.dart';

class ViewStaff extends StatefulWidget {
  const ViewStaff({Key? key}) : super(key: key);

  @override
  _ViewStaffState createState() => _ViewStaffState();
}

class _ViewStaffState extends State<ViewStaff> {
  final List<Map<String, dynamic>> staffList = [
    {"name": "John Doe", "age": 30, "gender": "Male"},
    {"name": "Jane Smith", "age": 25, "gender": "Female"},
    {"name": "Michael Johnson", "age": 35, "gender": "Male"},
    {"name": "Emily Davis", "age": 28, "gender": "Female"},
    {"name": "William Brown", "age": 33, "gender": "Male"},
    {"name": "Olivia Wilson", "age": 27, "gender": "Female"},
    {"name": "James Miller", "age": 32, "gender": "Male"},
    {"name": "Sophia Garcia", "age": 26, "gender": "Female"},
    {"name": "Benjamin Martinez", "age": 31, "gender": "Male"},
    {"name": "Charlotte Anderson", "age": 29, "gender": "Female"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Staffs"),
      ),
      body: ListView.builder(
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          final staff = staffList[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                staff['name'][0], // Display first character of name
                style: TextStyle(fontSize: 18),
              ),
            ),
            title: Text(staff['name']),
            subtitle: Text('Age: ${staff['age']}'),
            trailing: Text(staff['gender']),
          );
        },
      ),
    );
  }
}
