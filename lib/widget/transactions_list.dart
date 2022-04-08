import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_element.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionsList({required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions found',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Image.asset('not-found.png')
              ],
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: ListElement(listItem: userTransactions[index])),
                ]));
              }),
    );
  }
}
