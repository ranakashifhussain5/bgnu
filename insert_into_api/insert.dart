import 'dart:convert';
import 'package:class_api/insert_into_api/getdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class insert extends StatefulWidget {
  const insert({super.key});

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final semesterController = TextEditingController();
  final creditController = TextEditingController();
  final markController = TextEditingController();

  Future<void> insertdata() async {
    final response = await http.post(
      Uri.parse('https://devtechtop.com/management/public/api/grades'),
      body: {
        'user_id': idController.text,
        'course_name': titleController.text,
        'semester_no': semesterController.text,
        'credit_hours': creditController.text,
        'marks': markController.text,
      },
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: ${response.body}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Data submitted successfully")),
      );
      idController.clear();
      titleController.clear();
      semesterController.clear();
      creditController.clear();
      markController.clear();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Data in API'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: 'User ID'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Course Name'),
            ),
            TextFormField(
              controller: creditController,
              decoration: InputDecoration(labelText: 'Credit Hours'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: semesterController,
              decoration: InputDecoration(labelText: 'Semester No'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: markController,
              decoration: InputDecoration(labelText: 'Obtained Marks'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: insertdata,
              child: Text('Submit'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DataGet()));
            }, child: Text('Show data'))
          ],
        ),
      ),
    );
  }
}
