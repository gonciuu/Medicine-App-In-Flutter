import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:medicine/database/repository.dart';
import 'package:medicine/helpers/snack_bar.dart';
import 'package:medicine/models/medicine_type.dart';
import 'package:medicine/models/pill.dart';
import '../../helpers/platform_flat_button.dart';
import '../../screens/add_new_medicine/form_fields.dart';
import '../../screens/add_new_medicine/medicine_type_card.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AddNewMedicine extends StatefulWidget {
  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<AddNewMedicine> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Snackbar snackbar = Snackbar();

  final List<String> weightValues = ["pills", "ml", "mg"];
  final List<MedicineType> medicineTypes = [
    MedicineType("Syrup", Image.asset("assets/images/welcome_image.png"), true),
    MedicineType(
        "Tablet", Image.asset("assets/images/welcome_image.png"), false),
    MedicineType(
        "Capsules", Image.asset("assets/images/welcome_image.png"), false),
    MedicineType(
        "Cream", Image.asset("assets/images/welcome_image.png"), false),
    MedicineType(
        "Spray", Image.asset("assets/images/welcome_image.png"), false),
  ];

  //-------------Pill object------------------
  int howManyWeeks = 1;
  String selectWeight;
  DateTime setDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  //==========================================

  final Repository _repository = Repository();

  @override
  void initState() {
    super.initState();

    selectWeight = weightValues[0];

    //-----------------------------| Inicialize local notifications |--------------------------------------
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    //======================================================================================================
  }

  //-------------| function to inicialize local notifications |---------------------------
  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  //======================================================================================

  //---------------------------------| Show the notification in the specific time |-------------------------------
  Future _showNotification(
      String title, String description, int time, int id) async {
    print(id);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id.toInt(),
        title,
        description,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'medicines_id', 'medicines', 'medicines_notification_channel',
                importance: Importance.high,
                priority: Priority.high,
                color: Colors.cyanAccent)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  //================================================================================================================

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - 60.0;

    return Scaffold(
      key: _scaffoldKey,
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
                    child: FormFields(
                        howManyWeeks,
                        selectWeight,
                        popUpMenuItemChanged,
                        sliderChanged,
                        nameController,
                        amountController)),
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
                    ...medicineTypes.map(
                        (type) => MedicineTypeCard(type, medicineTypeClick))
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Container(
                width: double.infinity,
                height: deviceHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: PlatformFlatButton(
                          handler: () => openTimePicker(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat.Hm().format(this.setDate),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.access_time,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: PlatformFlatButton(
                          handler: () => openDatePicker(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat("dd.MM").format(this.setDate),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.event,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: deviceHeight * 0.09,
                width: double.infinity,
                child: PlatformFlatButton(
                  handler: () async => savePill(),
                  color: Theme.of(context).primaryColor,
                  buttonChild: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //slider changer
  void sliderChanged(double value) =>
      setState(() => this.howManyWeeks = value.round());

  //choose popum menu item
  void popUpMenuItemChanged(String value) =>
      setState(() => this.selectWeight = value);

  //------------------------OPEN TIME PICKER (SHOW)----------------------------
  //------------------------CHANGE CHOOSE PILL TIME----------------------------

  Future<void> openTimePicker() async {
    await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            helpText: "Choose Time")
        .then((value) {
      DateTime newDate = DateTime(
          setDate.year,
          setDate.month,
          setDate.day,
          value != null ? value.hour : setDate.hour,
          value != null ? value.minute : setDate.minute);
      setState(() => setDate = newDate);
      print(newDate.hour);
      print(newDate.minute);

    });
  }

  //====================================================================

  //-------------------------SHOW DATE PICKER AND CHANGE CURRENT CHOOSE DATE-------------------------------
  Future<void> openDatePicker() async {
    await showDatePicker(
            context: context,
            initialDate: setDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 100000)))
        .then((value) {
      DateTime newDate = DateTime(
          value != null ? value.year : setDate.year,
          value != null ? value.month : setDate.month,
          value != null ? value.day : setDate.day,
          setDate.hour,
          setDate.minute);
      setState(() => setDate = newDate);
      print(setDate.day);
      print(setDate.month);
      print(setDate.year);
    });
  }

  //=======================================================================================================

  //--------------------------------------SAVE PILL IN DATABASE---------------------------------------
  Future savePill() async {

    //create pill object
    Pill pill = Pill(
        amount: amountController.text,
        howManyWeeks: howManyWeeks,
        medicineForm: medicineTypes[
                medicineTypes.indexWhere((element) => element.isChoose == true)]
            .name,
        name: nameController.text,
        time: setDate.millisecondsSinceEpoch,
        type: selectWeight);


    //---------------------| Save as many medicines as many user checks |----------------------
    for (int i = 0; i < howManyWeeks; i++) {
      print((DateTime.fromMicrosecondsSinceEpoch(setDate.millisecondsSinceEpoch * 1000)).day);
      print((DateTime.fromMicrosecondsSinceEpoch(setDate.millisecondsSinceEpoch * 1000)).month);
      print((DateTime.fromMicrosecondsSinceEpoch(setDate.millisecondsSinceEpoch * 1000)).year);

      dynamic result = await _repository.insertData("Pills", pill.pillToMap());
      if (result == null) {
        snackbar.showSnack("Something went wrong", _scaffoldKey, null);
        return;
      } else {
        //set the notification schneudele
        tz.initializeTimeZones();
        tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
        await _showNotification(pill.name, pill.medicineForm + " " + pill.type,
            time, setDate.millisecondsSinceEpoch.toUnsigned(30));
        setDate = setDate.add(Duration(milliseconds: 604800000));
        pill.time = setDate.millisecondsSinceEpoch;
      }
    }
    //---------------------------------------------------------------------------------------
    Navigator.pop(context);
    snackbar.showSnack("Saved", _scaffoldKey, null);
  }

  //=================================================================================================

  //----------------------------CLICK ON MEDICINE FORM CONTAINER----------------------------------------
  void medicineTypeClick(MedicineType medicine) {
    setState(() {
      medicineTypes.forEach((medicineType) => medicineType.isChoose = false);
      medicineTypes[medicineTypes.indexOf(medicine)].isChoose = true;
    });
  }

  //=====================================================================================================

  //get time difference
  int get time =>
      setDate.millisecondsSinceEpoch -
      tz.TZDateTime.now(tz.local).millisecondsSinceEpoch;
}
