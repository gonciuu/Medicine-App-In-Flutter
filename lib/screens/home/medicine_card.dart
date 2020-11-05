import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine/models/pill.dart';

class MedicineCard extends StatelessWidget {
  final Pill medicine;

  MedicineCard(this.medicine);

  @override
  Widget build(BuildContext context) {
    final bool isEnd = DateTime.now().millisecondsSinceEpoch > medicine.time;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      margin: EdgeInsets.symmetric(vertical: 7.0),
      color: Colors.white,
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          title: Text(
            medicine.name,
            style: Theme.of(context).textTheme.headline1.copyWith(
                color: Colors.black,
                fontSize: 20.0,
                decoration: isEnd ? TextDecoration.lineThrough : null),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "${medicine.amount} ${medicine.medicineForm}",
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.grey[600],
                fontSize: 15.0,
                decoration: isEnd ? TextDecoration.lineThrough : null),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                DateFormat("HH:mm")
                    .format(DateTime.fromMillisecondsSinceEpoch(medicine.time)),
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    decoration: isEnd ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
          leading: Container(
            width: 60.0,
            height: 60.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(isEnd ? Colors.white : Colors.transparent, BlendMode.saturation),
                  child: Image.asset("assets/images/welcome_image.png")),
            ),
          )),
    );
  }
}
