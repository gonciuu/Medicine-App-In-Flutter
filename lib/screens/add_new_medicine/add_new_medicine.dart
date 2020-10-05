import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/helpers/platform_flat_button.dart';
import 'package:medicine/screens/add_new_medicine/form_fields.dart';
import '../../helpers/platform_slider.dart';
import '../../screens/add_new_medicine/medicine_type_card.dart';

class AddNewMedicine extends StatefulWidget {
  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<AddNewMedicine> {
  String selectWeight;
  final List<String> weightValues = ["pills", "ml", "mg"];

  int howManyWeeks = 1;

  @override
  void initState() {
    super.initState();
    selectWeight = weightValues[0];
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - 60.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: deviceHeight * 0.05,
                child: FittedBox(
                  child: InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0),
                height: deviceHeight * 0.06,
                child: FittedBox(
                    child: Text(
                  "Add Pills",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black),
                )),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Container(
                height: deviceHeight * 0.37,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FormFields(howManyWeeks,selectWeight,popUpMenuItemChanged,sliderChanged)
                ),
              ),
              Container(
                height: deviceHeight * 0.035,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: FittedBox(
                    child: Text(
                      "Medicine form",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Container(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (int i = 0; i < 6; i++) MedicineTypeCard()
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Container(
                width: double.infinity,
                height: deviceHeight * 0.09,
                child: PlatformFlatButton(
                  buttonChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "08:00",
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.notifications,size: 30,color: Theme.of(context).primaryColor,)
                    ],
                  ), handler: (){}, color : Color.fromRGBO(7, 190, 200, 0.1),
                ),
              ),
              Spacer(),
              Container(
                height: deviceHeight * 0.09,
                width: double.infinity,
                child: PlatformFlatButton(
                  color: Theme.of(context).primaryColor,
                  buttonChild: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                  handler: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sliderChanged(double value) =>
      setState(() => this.howManyWeeks = value.round());


  void popUpMenuItemChanged(String value) =>
      setState(() => this.selectWeight = value);

}
