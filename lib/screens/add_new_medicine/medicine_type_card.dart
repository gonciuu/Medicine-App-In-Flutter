import 'package:flutter/material.dart';


class MedicineTypeCard extends StatelessWidget {
  final String pillType;
  final Widget image;
  MedicineTypeCard(this.pillType,this.image);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            ),
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.0,),
                Container(width:50,height: 50.0,child: image),
                SizedBox(height: 7.0,),
                Container(child: Text(pillType,style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w500
                ),)),
              ],
            ),

          ),
        ),
        SizedBox(width: 15.0,)
      ],
    );
  }
}
