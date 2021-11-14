import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/constants/MyColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

class ThemeScreen extends StatefulWidget {
  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  Future setColor(int idx)async{
    await preferences.setInt("color", idx);
  }

  Future getColor()async{
    preferences = await SharedPreferences.getInstance();
    int idx = preferences.getInt("Color");
    primaryColor = getColorIndex(idx);
    print("color taken from saved instances");
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColor();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "Themes",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "General",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.blueAccent),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                primaryColor = Colors.red;
                setColor(1);
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.redAccent,
                child: Center(
                    child: Text(
                  "Red",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.4,
                  ),
                )),
              ),
            ),
            GestureDetector(
              onTap: (){
                primaryColor = Colors.teal;
                setColor(2);
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child: Center(
                    child: Text(
                      "Teal",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: (){
                primaryColor = Colors.pink;
                setColor(3);
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.pink,
                child: Center(
                    child: Text(
                      "Pink",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: (){
                primaryColor = Colors.orange;
                setColor(4);
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange,
                child: Center(
                    child: Text(
                      "Orange",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: (){
                primaryColor = Colors.purple;
                setColor(5);
                setState(() {

                });
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurpleAccent,
                child: Center(
                    child: Text(
                      "Purple",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
