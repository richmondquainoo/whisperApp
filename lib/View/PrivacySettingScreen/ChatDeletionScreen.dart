import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDeletionScreen extends StatefulWidget {

  @override
  _ChatDeletionScreenState createState() => _ChatDeletionScreenState();
}

class _ChatDeletionScreenState extends State<ChatDeletionScreen> {

  bool value = true;
  bool firstValue = true;
  bool secondValue = true;
  bool thirdValue = true;
  bool fourthValue = true;
  bool fifthValue = true;

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
          "Chat Deletion",
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
        child: Column(children: [
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Chat deletion",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: value,
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Container(
            child: Text(
              "One-on-one chats would be deleted when the toggle button is tapped",
              style: GoogleFonts.lato(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "After message has been read",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: firstValue,
                    onChanged: (value) => setState(() => this.firstValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "After 10 minute",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: secondValue,
                    onChanged: (value) => setState(() => this.secondValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "After 20 minutes",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: thirdValue,
                    onChanged: (value) => setState(() => this.thirdValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "After 25 minutes",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: fourthValue,
                    onChanged: (value) => setState(() => this.fourthValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "After 1 hour",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    inactiveTrackColor: Colors.grey,
                    value: fifthValue,
                    onChanged: (value) => setState(() => this.fifthValue = value),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
        ]),
      ),
    );
  }
}
