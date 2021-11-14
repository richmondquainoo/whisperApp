import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

class VibrationScreen extends StatefulWidget {

  @override
  _VibrationScreenState createState() => _VibrationScreenState();
}

class _VibrationScreenState extends State<VibrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        // shadowColor: Colors.white,
        // backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 23,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: GoogleFonts.lato(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
      body:Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text("Vibrate Default"),
                  onPressed: () async {
                    if (await Vibration.hasVibrator()) { //check if device has vibration feature
                      Vibration.vibrate(); //500 millisecond vibration
                    }
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text("Vibrate for 1 Sec"),
                  onPressed: (){
                    Vibration.vibrate(duration: 1000); //1 Sec = 1000 millisecond
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text("Vibrate With Pattern"),
                  onPressed: (){
                    Vibration.vibrate(
                        pattern: [
                          500, //wait 0.5 second
                          1000, //vibrate 1 second
                          500, //wait 0.5 second
                          3000 //vibrate 3 second.
                          //add more pattern here
                        ]
                    ); //1 Sec = 1000 millisecond
                  },
                ),
              )

            ],)
      ),
    );
  }
}
