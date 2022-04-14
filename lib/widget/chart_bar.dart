import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double totalAmount;

  ChartBar(
      {required this.label, required this.amount, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          height: 100,
          width: 20,
          child: Stack(
            clipBehavior: Clip.antiAlias,
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: const Color.fromARGB(255, 219, 221, 219),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                  heightFactor: amount / totalAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        FittedBox(child: Text(amount.toStringAsFixed(1))),
      ],
    );
  }
}
