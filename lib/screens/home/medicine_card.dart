import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      margin: EdgeInsets.symmetric(vertical:7.0),
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical:15.0,horizontal: 15.0),
          title: Text(
            "Sinupret",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.black, fontSize: 20.0),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "1 capsule",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.grey[600], fontSize: 15.0),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("13:00",style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
                fontSize: 15
              ),),
            ],
          ),
          leading: Container(
            width: 60.0,
            height: 60.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                  "assets/images/welcome_image.png"),
            ),
          )),
    );
  }
}
