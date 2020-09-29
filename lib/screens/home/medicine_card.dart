import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
          title: Text(
            "Sinupret",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.black, fontSize: 20.0),
          ),
          subtitle: Text(
            "1 capsule",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black, fontSize: 15.0),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5.0,),
              Text("13:00",style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 14.5
              ),),
            ],
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
                "https://img.freepik.com/free-vector/medicine-flat-design_1212-670.jpg?size=338&ext.jpg"),
          )),
    );
  }
}
