import 'package:flutter/material.dart';
import '../../screens/home/medicine_card.dart';

class MedicinesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MedicineCard(),
      itemCount: 15,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
