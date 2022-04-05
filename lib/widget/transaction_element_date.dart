import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListElementDate extends StatelessWidget {
  final DateTime date;
  const ListElementDate({Key? key, required this.date}) : super(key: key);
  String getDateEnding(String day) {
    int dayInInt = int.parse(day);
    switch (dayInInt) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  List formatDate(DateTime date) => [
        DateFormat.d('en_US').format(date),
        DateFormat.MMMM('en_US').format(date),
      ];

  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Text('${formatDate(date)[0]}${getDateEnding(formatDate(date)[0])}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                )),
            Text(formatDate(date)[1],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                )),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ));
  }
}
