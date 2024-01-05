import 'package:flutter/material.dart';
import 'package:loyalty_app/program_detail_page.dart';

import 'main.dart';

class LoyaltyProgram {
  final String title;
  final String imageUrl;
  final String description;

  LoyaltyProgram(
      {required this.title, required this.imageUrl, required this.description});
}

// Örnek Loyalty Programları
final List<LoyaltyProgram> loyaltyPrograms = [
  LoyaltyProgram(
      title: 'EspressoLab',
      imageUrl: 'assets/Eslab.png',
      description:
          "Hoş geldiniz, kahve severler! EspressoLab\'da her bir kahve deneyiminiz paha biçilemez. Her kahve alışverişinizle puan kazanın ve 10. kahvenizi bizden hediye alın. Burada her yudumda kalite ve lezzeti hissedin!"),
  LoyaltyProgram(
      title: 'Kahve Dünyası',
      imageUrl: 'assets/kahvedunyasi.png',
      description:
          'Kahve Dünyası\'na adım atın ve alışverişlerinizle puan toplayarak özel ödüllerin kapısını aralayın. Her alışverişinizle daha fazla kazanın, ücretsiz tatlar ve özel indirimler sizi bekliyor!'),
  LoyaltyProgram(
      title: 'Cafe Nero',
      imageUrl: 'assets/nero.jpg',
      description:
          "Cafe Nero\'da kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Dondurmacı',
      imageUrl: 'assets/mua.jpg',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'İtalyan Pizza',
      imageUrl: 'assets/pizza.jpg',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Burgercim',
      imageUrl: 'assets/burger.jpg',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Ev Yemekleri',
      imageUrl: 'assets/isletme1.jpg',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Doyasıya Makarna',
      imageUrl: 'assets/makarna.png',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Restaurant',
      imageUrl: 'assets/isletme2.jpg',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),
  LoyaltyProgram(
      title: 'Burger Dünyası',
      imageUrl: 'assets/images/burger.jpg',
      description:
          " kahvenin sihirli dünyasına dalın! Her ziyaretinizde puan kazanın ve biriktirdiğiniz puanlarla enfes tatlılar ve içecekler kazanın. Sıcak bir ortam, dost canlısı hizmet ve unutulmaz lezzetler için Cafe Nero sizleri bekliyor!"),

  // Diğer programlar...
];

class LoyaltyProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tüm Loyalty Programları'),
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
