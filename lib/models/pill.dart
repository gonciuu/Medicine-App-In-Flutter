

class Pill {
  String name;
  String amount;
  String type;
  int howManyWeeks;
  String medicineForm;
  DateTime time;

  Pill(
      {this.howManyWeeks,
      this.time,
      this.amount,
      this.medicineForm,
      this.name,
      this.type});

  //------------------set pill to map-------------------

  Map<String, dynamic> pillToMap() {
    Map<String, dynamic> map = Map();
    map['name'] = this.name;
    map['amount'] = this.amount;
    map['type'] = this.type;
    map['howManyWeeks'] = this.howManyWeeks;
    map['medicineForm'] = this.medicineForm;
    map['time'] = this.time;
    return map;
  }

  //=====================================================

  //---------------------create pill object from map---------------------
  Pill pillMapToObject(Map<String, dynamic> pillMap) {
    return Pill(
        name: pillMap['name'],
        amount: pillMap['amount'],
        type: pillMap['type'],
        howManyWeeks: pillMap['howManyWeeks'],
        medicineForm: pillMap['medicineForm'],
        time: pillMap['time']);
  }
  //=====================================================================
}
