import 'dart:convert';
import 'package:class_api/insert_into_api/UserModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class DataGet extends StatefulWidget {
  const DataGet({Key? key}) : super(key: key);

  @override
  _DataGetState createState() => _DataGetState();
}

class _DataGetState extends State<DataGet> {
  List<Data> courses = []; // List to hold fetched courses

  // Fetch data from the API
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://devtechtop.com/management/public/api/select_data'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Assuming the response structure has a key 'data' that contains the list of courses
      var courseData = data['data'];  // Extract the list of courses
      setState(() {
        courses = List<Data>.from(courseData.map((course) => Data.fromJson(course))); // Convert list of maps to list of Data objects
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetchData when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.teal,
      ),
      body: courses.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading until data is fetched
          : ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
              child:Column(
                children: [
                  Text(courses[index].courseName!),
                ],
              )
          );
        },
      ),
    );
  }
}
