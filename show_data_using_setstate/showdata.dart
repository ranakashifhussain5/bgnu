import 'package:flutter/material.dart';
class showdata extends StatefulWidget {
  const showdata({super.key});

  @override
  State<showdata> createState() => _showdataState();
}
TextEditingController dataController=TextEditingController();
class _showdataState extends State<showdata> {
  @override
  var data='';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Use set state'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: dataController,
            decoration: InputDecoration(
              label: Text('Enter Data')
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              data=dataController.text;
            });
          }, child:Text('Show Data')),
          SizedBox(height: 20,),
         Text(data)
        ],
      ),
    );
  }
}
