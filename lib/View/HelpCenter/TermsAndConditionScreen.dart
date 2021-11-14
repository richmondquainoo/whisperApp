import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/constants/MyColors.dart';

class TermsAndConditionScreen extends StatefulWidget {
  @override
  _TermsAndConditionScreenState createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms and Condition",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 380,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.6,
                      spreadRadius: 1.5,
                      color: Colors.black12,
                      offset: Offset(0.2, 1),
                    ),
                  ],
                  color: kPrimaryColor5,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Subject to finance provisions may be also referred"
                    "to as contingent conditions, which to as contingent conditions,"
                    " which come under two categories: condition precedent and "
                    "condition subsequent Conditions precedent are conditions "
                    "that have to be. Conditions precedent are conditions "
                    "that Conditions precedent are conditions thatperformance of"
                    "a contract is required by both parties With conditions "
                    "subsequent, parties do not need to perform"
                    "Subject to finance provisions may be also referred"
                    "to as contingent conditions, which to as contingent conditions,"
                    " which come under two categories: condition precedent and "
                    "condition subsequent Conditions precedent are conditions "
                    "that have to be. Conditions precedent are conditions "
                    "that Conditions precedent are conditions thatperformance of"
                    "a contract is required by both parties With conditions "
                    "subsequent, parties do not need to perform.",
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        wordSpacing: 0.3,
                        color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
