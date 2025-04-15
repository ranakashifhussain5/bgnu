import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firebase_services/firebase_service.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override

  TextEditingController emailController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController degreeController= TextEditingController();
  firebaseServices _firebaseServices=firebaseServices();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('email')
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  label: Text('Name')
              ),
            ),
            TextFormField(
              controller: degreeController,
              decoration: InputDecoration(
                  label: Text('Department')
              ),
            ),
            ElevatedButton(onPressed: (){
              _firebaseServices.add(emailController.text,nameController.text, degreeController.text);
              nameController.clear();
              emailController.clear();

              degreeController.clear();

            }, child:Text('Add User')),
            Expanded(child:StreamBuilder(stream: firebaseFirestore.collection('user').snapshots(),
                builder:(context,snapshot){
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    final res=snapshot.data!.docs[index];
                return Card(
                  child:ListTile(
                    title:Text(res['name']),
                    subtitle: Text(res['email']),
                    trailing: IconButton(onPressed: (){
                      _firebaseServices.delete(res.id,context);
                    }, icon:Icon(Icons.delete,color:Colors.red,)),
                  ),
                );
              });
                }))
          ],
        ),
      ),
    );
  }

}
