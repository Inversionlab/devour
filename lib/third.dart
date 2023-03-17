import 'package:flutter/material.dart';
import 'package:hommy/first.dart';

import 'package:lottie/lottie.dart';

class third extends StatelessWidget {
  const third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xff283048),
                      Color(0xff859398),
                    ]
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150),
            child: Container(
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,

                ),
              ),
              decoration: BoxDecoration(

                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),

            ),
          ),
          Positioned(
            top: 80,

            child: Column(
              children:[
                Container(
                  height: 400,
                  width: 400,
                  child:Lottie.network("https://assets4.lottiefiles.com/private_files/lf30_fmzfmcm5.json"),
                ),
                SizedBox(height: 20,),
                Text(" THANKS FOR\n\n FEEDING ME,MASTER",
                  style: TextStyle(color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'ptt',
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>first()),(Route<dynamic> route) => false);
                  },
                  child: Center(
                    child:Text(" want to feed again?CLICK HERE",
                      style: TextStyle(color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'ptt',
                      ),),
                  ),
                ),
              ],
            ),),
        ],
      ),
    );
  }
}
