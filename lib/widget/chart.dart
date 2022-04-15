import 'package:first_flutter_app/models/transaction.dart';
import 'package:first_flutter_app/widget/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    var totalAmount = 0.0;
    if (recentTransaction.isEmpty) {
      return Container();
    } else {
      groupedTransactionsValues
          .forEach((element) => totalAmount += (element['amount'] as double));
      return Card(
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactionsValues
                  .map((e) => Flexible(
                        fit: FlexFit.tight,
                        child: ChartBar(
                            label: e['day'].toString(),
                            amount: e['amount'] as double,
                            totalAmount: totalAmount),
                      ))
                  .toList()));
    }
  }
}
