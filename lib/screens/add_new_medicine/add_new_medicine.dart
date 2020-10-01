import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/helpers/platform_slider.dart';

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
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
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
                height: deviceHeight * 0.02,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          labelText: "Pills Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.03,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 20.0),
                                labelText: "Pills Amount",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 20.0),
                                labelText: "Type",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey))),
                            items: weightValues
                                .map((weight) => DropdownMenuItem(
                                      child: Text(weight),
                                      value: weight,
                                    ))
                                .toList(),
                            onChanged: (value) =>
                                setState(() => this.selectWeight = value),
                            value: selectWeight,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text("How long?"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: PlatformSlider(
                                divisions: 11,
                                min: 1,
                                max: 10,
                                value: howManyWeeks,
                                color: Theme.of(context).primaryColor,
                                handler: sliderChanged)),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('$howManyWeeks weeks'),
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

  void sliderChanged(double value) =>
      setState(() => this.howManyWeeks = value.toInt());
}
