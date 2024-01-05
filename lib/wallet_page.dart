import 'package:flutter/material.dart';
import 'package:loyalty_app/main.dart';
import 'package:loyalty_app/wallet_detail_page.dart';

class UserProgram {
  final String title;
  final String imageUrl;
  final int points;
  final int programtype;

  UserProgram(
      {required this.title,
      required this.imageUrl,
      required this.points,
      required this.programtype});
}

// Örnek Kullanıcı Programları
final List<UserProgram> userPrograms = [
  UserProgram(
      title: 'Cafe Nero ',
      imageUrl: 'assets/nero.jpg',
      points: 120,
      programtype: 1),
  UserProgram(
      title: 'Mua Dondurma',
      imageUrl: 'assets/mua.jpg',
      points: 5,
      programtype: 2),
  UserProgram(
      title: 'Espresso Lab',
      imageUrl: 'assets/Eslab.png',
      points: 3,
      programtype: 2),
];

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cüzdanlarım'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: userPrograms.length,
        itemBuilder: (context, index) {
          final program = userPrograms[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(program.imageUrl),
                radius: 25,
              ),
              title: Text(program.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Puanlar: ${program.points}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WalletDetailPage(
                      title: program.title,
                      points: program.points,
                      programtype: program.programtype,
                      imageUrl: program.imageUrl,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
