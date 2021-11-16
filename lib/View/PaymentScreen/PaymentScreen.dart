import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisper_badbadoo/Component/TextButtonComponent.dart';
import 'package:whisper_badbadoo/Util/Utility.dart';
import 'package:whisper_badbadoo/View/Settings/SettingsScreen.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var addNumberController = TextEditingController();
  var myNumberController = TextEditingController();
  String addNumber;
  String myNumber;
  String _dropDownValue;

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
          "Payment",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                height: 100,
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.credit_card_rounded,
                              size: 42,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Mobile money",
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 10,),
                    // Container(
                    //   height: 200,
                    //   width: 170,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.black12,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         child: Icon(
                    //           Icons.credit_card_rounded,
                    //           size: 42,
                    //         ),
                    //       ),
                    //       SizedBox(height: 10,),
                    //       Container(
                    //         child: Text(
                    //           "Mobile money",
                    //           style: GoogleFonts.lato(
                    //               fontSize: 16, fontWeight: FontWeight.w300),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              DropdownButton(
                hint: _dropDownValue == null
                    ? Text('Select mobile network')
                    : Text(
                        _dropDownValue,
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                isExpanded: true,
                iconSize: 40.0,
                style: TextStyle(color: Colors.blue),
                items: ['MTN', 'Vodafone', 'AirtelTigo'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(
                        val,
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val;
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 65,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  // color: Colors.black38,
                  border: Border.all(
                      color: Colors.blueAccent, // set border color
                      width: 0.95), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: Center(
                  child: TextField(
                    // style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: addNumberController,
                    onChanged: (value) {
                      addNumber = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add,
                        size: 22,
                      ),
                      // labelStyle: TextStyle(color: Colors.white),
                      // hintStyle: TextStyle(
                      //   color: Colors.white,
                      // ),
                      hintText: 'Add New Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.credit_card_rounded,
                              size: 42,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "Mobile money",
                              style: GoogleFonts.lato(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image(
                              image: AssetImage('assets/images/mtn.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 260,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                // color: Colors.black38,
                                border: Border.all(
                                    color: Colors.blueAccent, // set border color
                                    width: 0.95), // set border width
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10.0)), // set rounded corner radius
                              ),
                              child: Center(
                                child: TextField(
                                  // style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  controller: myNumberController,
                                  onChanged: (value) {
                                    myNumber = value;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.add,
                                      size: 22,
                                    ),
                                    // labelStyle: TextStyle(color: Colors.white),
                                    // hintStyle: TextStyle(
                                    //   color: Colors.white,
                                    // ),
                                    hintText: 'Enter Number',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: TextButtonComponent(
                    borderRadius: 9,
                    labelColor: Colors.blueAccent,
                    label: 'Pay Now',
                    onTap: () {
                      new UtilityService().confirmationBox(
                          color: Colors.blueAccent,
                          context: context,
                          title: 'Submission',
                          message:
                          'Want to proceed with payment?',
                          onNo: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          onYes: () {
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
