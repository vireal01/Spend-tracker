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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              height: constraints.maxHeight * 0.55,
              width: 15,
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
                        height: constraints.maxHeight * 0.15,
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
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(amount.toStringAsFixed(1)),
              ),
            ),
          ],
        );
      },
    );
  }
}
