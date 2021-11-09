//import 'package:rider_app/Views/GettingStartedPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TopBarComponent extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function iconFunction;
  final Function labelFunction;
  final Color userColor;


  TopBarComponent({
    @required this.icon,
    this.label,
    @required this.iconFunction,
    this.labelFunction,
    this.userColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: iconFunction,
                child: Container(
                  child: icon,

                ),
              ),
              GestureDetector(
                onTap: labelFunction != null ? labelFunction : (){},
                child: Container(
                  child: Text(
                    label != null ? label : "",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: userColor != null ? userColor : Colors.blueAccent,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
