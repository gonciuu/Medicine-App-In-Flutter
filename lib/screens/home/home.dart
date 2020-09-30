
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/home/medicines_list.dart';
import '../../screens/home/calendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;


    final Widget addButton = FloatingActionButton(
      elevation: 2.0,
      onPressed: (){
        Navigator.pushNamed(context, "/add_new_medicine");
      },
      child: Icon(Icons.add, color: Colors.white, size: 24.0,),
      backgroundColor: Theme.of(context).primaryColor,
    );


    return Scaffold(
      floatingActionButton: addButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 0.0, left: 25.0,right: 25.0,bottom: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:5.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: deviceHeight * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Journal",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(color: Colors.black),
                        ),
                        Icon(
                          Icons.notifications_none,
                          size: 42.0,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:5.0),
                  child: Calendar(),
                ),
                SizedBox(height: deviceHeight*0.03),
                MedicinesList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
