import 'package:flutter/material.dart';
import 'package:medicine/models/pill.dart';
import '../../screens/home/medicine_card.dart';

class MedicinesList extends StatelessWidget {
  final List<Pill> listOfMedicines;
  MedicinesList(this.listOfMedicines);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MedicineCard(listOfMedicines[index]),
      itemCount: listOfMedicines.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
