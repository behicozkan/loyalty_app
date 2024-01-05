import 'package:flutter/material.dart';
import 'package:loyalty_app/loyalty_programs_page.dart';

import 'main.dart';

class ProgramDetailPage extends StatelessWidget {
  final LoyaltyProgram program;

  ProgramDetailPage({required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(program.title),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        // Uzun metinler için kaydırma işlevselliği eklendi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(program.imageUrl, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    program.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    program.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // İhtiyaca bağlı olarak daha fazla widget ve bilgi buraya eklenebilir
          ],
        ),
      ),
    );
  }
}
