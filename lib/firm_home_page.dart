import 'package:flutter/material.dart';

enum TransactionType { reward, purchase }

class FirmPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<FirmPage> {
  final TextEditingController _walletIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  TransactionType _transactionType = TransactionType.reward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İşlem Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionTypeSelector(),
            TextField(
              controller: _walletIdController,
              decoration: InputDecoration(
                labelText: 'Cüzdan ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Tutar',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: İşlemi gerçekleştirme mantığını buraya yazın
                  print(
                      'İşlem Tipi: ${_transactionType.toString()}, Cüzdan ID: ${_walletIdController.text}, Harcanan Tutar: ${_amountController.text}');
                },
                child: const Text('İşlemi Gerçekleştir'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTypeSelector() {
    return Column(
      children: [
        RadioListTile<TransactionType>(
          title: const Text('Ödül Harcama'),
          value: TransactionType.reward,
          groupValue: _transactionType,
          onChanged: (TransactionType? value) {
            setState(() {
              _transactionType = value!;
            });
          },
        ),
        RadioListTile<TransactionType>(
          title: const Text('Satın Alma İşlemi'),
          value: TransactionType.purchase,
          groupValue: _transactionType,
          onChanged: (TransactionType? value) {
            setState(() {
              _transactionType = value!;
            });
          },
        ),
      ],
    );
  }
}
