import 'package:flutter/material.dart';
import 'package:medicine/models/medicine_type.dart';


class MedicineTypeCard extends StatelessWidget {
  final MedicineType pillType;
  final Function handler;
  MedicineTypeCard(this.pillType,this.handler);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => handler(pillType),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            color: pillType.isChoose ? Color.fromRGBO(7, 190, 200, 1) :Colors.white,
            ),
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.0,),
                Container(width:50,height: 50.0,child: pillType.image),
                SizedBox(height: 7.0,),
                Container(child: Text(pillType.name,style: TextStyle(
                  color:pillType.isChoose ? Colors.white : Colors.black,fontWeight: FontWeight.w500
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
