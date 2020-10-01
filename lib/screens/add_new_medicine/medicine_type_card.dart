import 'package:flutter/material.dart';



class MedicineTypeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          ),
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Icon(Icons.local_drink,color: Theme.of(context).primaryColor,),),
              SizedBox(height: 7.0,),
              Container(child: Text("Capsule",style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.w500
              ),)),
            ],
          ),

        ),
        SizedBox(width: 15.0,)
      ],
    );
  }
}
