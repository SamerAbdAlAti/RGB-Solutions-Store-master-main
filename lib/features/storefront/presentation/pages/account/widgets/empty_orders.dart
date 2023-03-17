import 'package:flutter/material.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).cardTheme.color),
        height: 150,
        width: double.infinity,
        child: Text(
          "لا توجد طلبات سابقة",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ));
  }
}
