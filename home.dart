import 'package:flutter/material.dart';
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         // backgroundColor: Color(0xfff9f9f9),
          leading:Padding(padding:EdgeInsets.only(left: 10),
          child:Image.asset('images/logo.jpg'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BaBa Guru Nanak University',style:TextStyle(color: Color(0xff0F1C5B),fontWeight: FontWeight.bold,fontSize:20),),
              Text('Nankana',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ],
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Image.asset(
                'images/bgnu.jpeg',
                width: screenWidth,  // Full screen width
                height: screenHeight * 0.35, // 30% of screen height
                fit: BoxFit.cover, // Adjust the image to fit properly
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                  child: Text('About us',style: TextStyle(color: Color(0xff0F1C5B),fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: screenWidth*0.8,
                  padding: EdgeInsets.all(8),//for inside space
          
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('BaBa Guru Nanak University (BGNU)',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('Baba Guru Nanak University (BGNU) is a Public sector university '
                          'located in District Nankana Sahib, in the Punjab region of Pakistan. It plans to facilitate between 10,000 to 15,000 students from all over the world at the university. The foundation stone of the university was laid on October 28, 2019 ahead of 550th of Guru Nanak Gurpurab by the Prime Minister of Pakistan. On July, 02, 2020 Government of Punjab has formally passed Baba Guru Nanak University Nankana Sahib Act 2020 (X of 2020).',textAlign:TextAlign.justify,),
                      SizedBox(height: 9,),
                       Image.asset('images/images.jpg',
                       width: screenWidth,),
                      SizedBox(height: 10,),
                      Text('Baba Guru Nanak University Nankana Sahib has also announced Centre of Excellence for Baba Guru Nanak & Sikh Cultural Heritage along with separate Chair focusing on Punjab Studies.',textAlign:TextAlign.justify ,)
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Color(0xff1F2C75),
      
                ),
                child:Center(
                child:Text('© BGNU is Proudly Owned by BGNU',style: TextStyle(color: Colors.white,fontSize: 16),textAlign:TextAlign.center,),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}

