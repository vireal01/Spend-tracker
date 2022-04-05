import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_element.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> trnsactions;
  final int index;

  TransactionsList({required this.trnsactions, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: [
            ListElement(
              listItem: trnsactions[index],
            ),
          ],
        )
      ],
    );
  }
}
