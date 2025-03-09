import 'package:flutter/material.dart';
class grade extends StatefulWidget {
  const grade({super.key});

  @override
  State<grade> createState() => _gradeState();
}

class _gradeState extends State<grade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Grade'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Books Grades',style: TextStyle(fontSize: 30),),
          SizedBox(height: 5,),
          Padding(
              padding: EdgeInsets.all(15),
              child: Table(
                columnWidths: {
                  0:FlexColumnWidth(1),
                  1:FlexColumnWidth(1),
                  2:FlexColumnWidth(1),

                },
                border: TableBorder.all(),
                children: [

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    children: [
                      TableCell(child: Text('Name',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                      TableCell(child: Text('Semester',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                      TableCell(child: Text('Grade',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center))
                    ]
                  ),
                  //TableRow(
                    //  children: [
                       // TableCell(child: Text('Waqar',textAlign: TextAlign.center)),
                      //  TableCell(child: Text('6th',textAlign: TextAlign.center)),
                       // TableCell(child: Text('A',textAlign: TextAlign.center))
                    //  ]
                  //),
                  tableRow('hamza', '6th', 'A'),
                  tableRow('Awais', '6th', 'A'),
                  tableRow('Umair', '6th', 'A'),

                ],

              ),
            ),
        ],
      ),

    );
  }
  TableRow tableRow (String name,String semester,String grade){
    return TableRow(children: [
      Container(
          padding: EdgeInsets.all(10),
          child: Center(child: Text(name),)) ,
      Container(
          padding: EdgeInsets.all(10),
          child: Center(child: Text(semester),)) ,
      Container(
          padding: EdgeInsets.all(10),
          child: Center(child: Text(grade),)) ,

    ]);
  }
}
