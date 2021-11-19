import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.45),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: Icon(Icons.arrow_back_ios_outlined, size: 22, color:Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: Icon(Icons.more_vert_outlined, size: 22, color:Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 70,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(260),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          child: Image(
                            image: AssetImage("assets/images/alarm.png",),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Event",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
