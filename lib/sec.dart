import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hommy/third.dart';
import 'package:lottie/lottie.dart';


class sec extends StatefulWidget {
  @override
  State<sec> createState() => _secState();
}

class _secState extends State<sec> {
  XFile? file;
  Future upld() async{
    final path='files/${file!.path!}';
    final files=File(file!.path!);
    final ref=FirebaseStorage.instance.ref().child(path);

    ref.putFile(files);
  }

  late List<CameraDescription> cameras;
  late CameraController ccontrol;
  @override
  void initState() {
    startCamera();
    super.initState();

  }
  void startCamera() async {
    cameras= await availableCameras();
    ccontrol=CameraController(cameras[0], ResolutionPreset.max,enableAudio: false);
    await ccontrol.initialize().then((value){
      if(!mounted){
        return;
      }
      setState(() {});
    }).catchError((e){
      print(e);
    });
  }
  @override
  void dispose() {
    ccontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(ccontrol.value.isInitialized){
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
                    height: 200,
                    width: 200,
                    child:Lottie.network("https://assets1.lottiefiles.com/packages/lf20_jvtpl16e.json"),
                  ),
                  SizedBox(height: 20,),
                  Text(" PLEASE SHARE\n\n SOME OF YOUR FOOD..",
                    style: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'ptt',
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    height: 300,
                    width: 300,

                    child: CameraPreview(ccontrol),
                  ),
                  SizedBox(height: 20,),
                  Text("CLICK YOUR MEAL..",
                    style: TextStyle(color: Colors.black38,
                        fontSize: 20,
                        fontFamily: 'ptt',
                        fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.teal,
                    onPressed:(){

                      ccontrol.takePicture().then((file){
                        if(mounted){
                          if(file!=null){
                            print("picture saved to ${file.path}");
                            Notify();
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>third()));
                            upld();
                          }
                        }
                      } );
                    },icon:Icon(Icons.camera_alt_outlined), label: Text("CLICK IT"),)
                ],
              ),),
          ],
        ),
      );
    }
    else{
      return CircularProgressIndicator(color: Colors.cyanAccent,);
    }
  }
  void Notify() async{
    await AwesomeNotifications().createNotification(content:NotificationContent(id: 1,
        channelKey: '1',
      title: "Hello Master",
      body: 'Thanks for Sharing your Food with me'

    ) );
  }

}
