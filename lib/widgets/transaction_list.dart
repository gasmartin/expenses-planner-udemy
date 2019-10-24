import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  Widget _createTransactionList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
                    child: Text(
                      "\$${_transactions[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 5)
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        DateFormat.yMMMd().format(_transactions[index].date),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _transactions.length,
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.length > 0 ? _createTransactionList() : Column(
        children: <Widget>[
          Text(
            "No transactions added yet", 
            style: Theme.of(context).textTheme.title
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset(
            "assets/images/waiting.png", 
            fit: BoxFit.cover
            ),
          )
        ],
      )
    );
  }
}