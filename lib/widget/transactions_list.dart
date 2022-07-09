import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_element1.dart';
import 'transaction_element.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final listTheme;
  final deleteTransaction;

  TransactionsList(
      {required this.userTransactions,
      required this.listTheme,
      required this.deleteTransaction});

  Widget getListElement(index) {
    if (listTheme['default']) {
      return ListElement(listItem: userTransactions[index]);
    } else {
      return NewListElement(listItem: userTransactions[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransactions.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.2,
                  ),
                  Text(
                    'No transactions found',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.3,
                      child: Image.asset('assets/images/no-results.png',
                          fit: BoxFit.cover))
                ],
              );
            }))
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(userTransactions[index].id.toString()),
                  child: getListElement(index),
                  onDismissed: (onDismissed) {
                    deleteTransaction(userTransactions[index].id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Transaction deleted',
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Theme.of(context).errorColor,
                    ));
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 10),
                    color: Theme.of(context).errorColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Remove item',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
