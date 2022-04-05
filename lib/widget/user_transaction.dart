import 'package:first_flutter_app/widget/input_field.dart';
import 'package:first_flutter_app/widget/transactions_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 0,
      title: 'Food',
      amount: 10.0,
      date: DateTime(2022, 4, 4, 17),
    ),
    Transaction(
      id: 1,
      title: 'Restaurant',
      amount: 20.0,
      date: DateTime(2022, 3, 25, 17),
    ),
    Transaction(
      id: 2,
      title: 'Georgian Restaurant',
      amount: 40.0,
      date: DateTime(2022, 3, 2, 17),
    ),
    Transaction(
      id: 2,
      title: 'Bla bla',
      amount: 10.0,
      date: DateTime(2022, 3, 1, 17),
    ),
    Transaction(
      id: 2,
      title: 'Lol kekw',
      amount: 10.0,
      date: DateTime(2022, 3, 1, 17),
    ),
    Transaction(
      id: 2,
      title: 'Lelw Kok',
      amount: 10.0,
      date: DateTime(2022, 3, 1, 17),
    )
  ];

  void _addNewTransactionElement({
    required String title,
    required double amount,
  }) {
    setState(() {
      _userTransactions.add(Transaction(
          id: _userTransactions.length,
          title: title,
          amount: amount,
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.amber,
            child: Text('Chart'),
            elevation: 10,
          ),
        ),
        InputField(
          addNewTransactionElement: _addNewTransactionElement,
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemBuilder: (context, index) => TransactionsList(
              trnsactions: _userTransactions,
              index: index,
            ),
            itemCount: _userTransactions.length,
          ),
        )
      ],
    );
  }
}
