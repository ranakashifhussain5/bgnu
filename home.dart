import 'package:flutter/material.dart';
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(padding:EdgeInsets.all(6),
        child:Image.asset('images/logo.jpg'),
        ),
        title: Text('BaBa Guru Nanak University',style:TextStyle(color: Color(0xff0F1C5B),fontWeight: FontWeight.bold,fontSize:20),),

      ),
    );
  }
}
