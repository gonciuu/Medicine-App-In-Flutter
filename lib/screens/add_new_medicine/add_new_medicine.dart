import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddNewMedicine extends StatefulWidget {
  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<AddNewMedicine> {
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: deviceHeight * 0.05,
                child: FittedBox(
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_back
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(height: deviceHeight * 0.02,),
              Container(
                padding: EdgeInsets.only(left: 15.0),
                height: deviceHeight * 0.06,
                child: FittedBox(
                  child: Text("Add Pills",style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black),)
                ),
              ),SizedBox(height: deviceHeight * 0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                        labelText: "Pills Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width:0.5,color: Colors.grey)
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}