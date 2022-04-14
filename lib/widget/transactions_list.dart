import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_element1.dart';
import 'transaction_element.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final listTheme;

  TransactionsList({required this.userTransactions, required this.listTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions found',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                    height: 150,
                    child: Image.asset('assets/images/no-results.png',
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (context, index) {
                if (listTheme['default']) {
                  return ListElement(listItem: userTransactions[index]);
                } else {
                  return NewListElement(listItem: userTransactions[index]);
                }
              }),
    );
  }
}
