import 'package:flutter/material.dart';
import 'package:loyalty_app/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletDetailPage extends StatelessWidget {
  final String title;
  final int points;
  final int programtype;
  final String imageUrl; // Örnek resim yolu

  WalletDetailPage(
      {required this.title,
      required this.points,
      required this.programtype,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final qrData = 'Program: $title, Puanlar: $points'; // QR kodu için veri

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Hoş geldiniz! Sadakat Programımıza katılarak her ziyaretinizde puan kazanın ve özel ödüllerin keyfini çıkarın. ',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10), // Metin arasında boşluk bırakmak için
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width:
                              5), // İkon ve metin arasında boşluk bırakmak için
                      Text('Toplam Yıldızınız: $points',
                          style: TextStyle(fontSize: 16)),
                      Icon(Icons.star, color: Colors.amber)
                    ],
                  ),
                ],
              ),
            ),
            _buildRewardProgress(context, points, programtype),
            _buildLoyaltyCard(context, qrData),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardProgress(
      BuildContext context, int points, int programtype) {
    if (programtype == 1) {
      return _buildSingleStarBar(context, points, [
        50,
        100,
        200,
        300
      ], [
        'assets/cup.jpg',
        'assets/bottle.jpg',
        'assets/cake.jpg',
        'assets/thermos.jpg'
      ]);
    } else if (programtype == 2) {
      return _buildTenStarBar(context, points);
    }
    // Diğer program tipleri için farklı UI bileşenleri eklenebilir
    return SizedBox();
  }

  Widget _buildTenStarBar(BuildContext context, int points) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return Icon(
                Icons.icecream,
                color: index < points ? Colors.pink : Colors.grey,
                size: 30,
              );
            }),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return Icon(
                Icons.icecream,
                color: index + 5 < points ? Colors.pink : Colors.grey,
                size: 30,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleStarBar(BuildContext context, int currentStars,
      List<int> starTargets, List<String> rewardImages) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: starTargets.map((star) {
              return Expanded(
                child: Column(
                  children: [
                    Icon(Icons.star,
                        color:
                            currentStars >= star ? Colors.amber : Colors.grey),
                    Text('$star'),
                  ],
                ),
              );
            }).toList(),
          ),
          LinearProgressIndicator(
            value: currentStars / starTargets.last,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rewardImages.map((image) {
              return Image.asset(image, width: 50, height: 50);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoyaltyCard(BuildContext context, String qrData) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text('Kart ID: 12*** 45** **** **12',
                style: TextStyle(color: Colors.white)),
            SizedBox(height: 10),
            Text('Toplam Yıldız: $points',
                style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Butonun arka plan rengi
                  onPrimary: Colors.black, // Butonun metin ve ikon rengi
                ),
                icon: Icon(Icons.receipt, color: Colors.black54),
                label: Text('İşlem geçmişi'),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => QrCodePage(qrData: qrData),
                )),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Butonun arka plan rengi
                  onPrimary: Colors.black, // Butonun metin ve ikon rengi
                ),
                icon: Icon(Icons.qr_code_scanner, color: Colors.black54),
                label: Text('QR Okut'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QrCodePage extends StatelessWidget {
  final String qrData;

  QrCodePage({required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Kodu'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 250.0,
        ),
      ),
    );
  }
}
