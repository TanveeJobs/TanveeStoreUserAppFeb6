import 'package:flutter/material.dart';

class KeyValueWidget extends StatelessWidget {
  String keyText;
  String valueText;


  KeyValueWidget({this.keyText="", this.valueText=""});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              keyText,
              // // textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(width: 4),
          Expanded(
            flex: 2,
            child: Text(
             valueText,
              style: TextStyle(
                  color: Colors.grey[700]
            ),
          ),)
        ],),
    );
  }
}
