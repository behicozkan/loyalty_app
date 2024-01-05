import 'package:flutter/material.dart';
import 'package:loyalty_app/loyalty_programs_page.dart';
import 'package:loyalty_app/program_detail_page.dart';

import 'main.dart';

// Örnek Loyalty Programları
final List<LoyaltyProgram> loyaltyPrograms = [
  LoyaltyProgram(
      title: 'Cafe Nero',
      imageUrl: 'assets/nero.jpg',
      description:
          "Cafe Nero\'da kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Mua Dondurma',
      imageUrl: 'assets/mua.jpg',
      description:
          'Mua Dondurma\'da tatlı bir serüvene hazır olun! Burada, her dondurma alışverişiniz bir sonraki lezzetli hediye için bir adım. Her 10 dondurmanızdan biri bizden hediye! Dondurmanın en taze ve en doğal halini keşfedin, her yudumda ayrıcalıklı lezzetlerin keyfini sürün. Çeşit çeşit aromalar ve rengarenk seçeneklerle, Mua Dondurma sizi gerçek bir tatlı cennetine davet ediyor. Özel etkinlikler, tatlı sürprizler ve çok daha fazlası için Mua Dondurma\'nın sadakat programına katılın, tatlı anların tadını çıkarın!'),
  LoyaltyProgram(
      title: 'Espresso Lab',
      imageUrl: 'assets/Eslab.png',
      description:
          "Hoş geldiniz, kahve severler! EspressoLab\'da her bir kahve deneyiminiz paha biçilemez. Her kahve alışverişinizle puan kazanın ve 10. kahvenizi bizden hediye alın. Burada her yudumda kalite ve lezzeti hissedin!"),
  // Diğer programlar...
];

class SubscribedProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dahil Olunan Programlar'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
              1, // Kutuların boyutunu ayarla (daha kare yapmak için)
        ),
        itemCount: loyaltyPrograms.length,
        itemBuilder: (context, index) {
          final program = loyaltyPrograms[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProgramDetailPage(program: program)),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            10)), // Resmin üst kenarlarını yuvarla
                    child: Image.asset(program.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(program.title, textAlign: TextAlign.center),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
