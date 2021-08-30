import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        //pode envolver esse componenete com o padding para melhorar o alinhamento
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(key: GlobalObjectKey(tr), tr: tr, onRemove: onRemove);
            },
          );
        // : ListView(
        //     children: transactions.map((tr) {
        //       return TransactionItem(
        //           key: ValueKey(tr.id), tr: tr, onRemove: onRemove);
        //     }).toList(),
        //   );
  }
}
