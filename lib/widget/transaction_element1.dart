import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'transaction_element_date.dart';

class NewListElement extends StatelessWidget {
  @override
  Transaction listItem;
  NewListElement({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text(
                  '\$${listItem.amount.toStringAsFixed(2)}',
                  style: TextStyle(color: Theme.of(context).bottomAppBarColor),
                ),
              ),
            ),
          ),
          title: Text(
            listItem.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(DateFormat.yMMMMd().format(listItem.date)),
        ),
      ),
    );
  }
}
