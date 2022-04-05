import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_element_date.dart';

class ListElement extends StatelessWidget {
  @override
  Transaction listItem;
  ListElement({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListElementDate(date: listItem.date),
            Column(
              children: [
                Text(
                  listItem.title,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Container(
              child: Text(
                '\$${listItem.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(255, 38, 125, 196)),
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
