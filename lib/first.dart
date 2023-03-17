import 'package:flutter/material.dart';
import 'package:hommy/sec.dart';
import 'package:lottie/lottie.dart';

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("FEED YOUR PET,\n\nSOME FOOD...\n\nHE'S HUNGRY...",
                style: TextStyle(color: Colors.white,
                    fontSize: 25,
                  fontFamily: 'ptt',
                  fontWeight: FontWeight.bold),),
            ),
            Center(child: Container(
                height: 300,
                width: 300,
                child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_YatxHD.json"))),
            FloatingActionButton.extended(
              elevation: 5,
              backgroundColor: Colors.amber,
              onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>sec()));
            }, label: Text("SHARE YOUR FOOD.."),icon: Icon(Icons.restaurant),),
            
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.tealAccent,
              Colors.teal,
            ],
          ),
        ),
      ),
    );
  }
}
