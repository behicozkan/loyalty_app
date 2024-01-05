import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loyalty_app/loyalty_programs_page.dart';
import 'package:loyalty_app/profile_page.dart';
import 'package:loyalty_app/subscribed_programs.dart';
import 'package:loyalty_app/wallet_page.dart';
import 'main.dart';
// Carousel Slider için paketi ekleyin

class HomePage extends StatefulWidget {
  final String userId;
  final String email;
  final String name;

  HomePage(
      {Key? key, required this.userId, required this.email, required this.name})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Her indeks için sayfaları yönetmek için bir fonksiyon
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      // Profil sayfası indeksi
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfilePage(
                  userId: widget.userId,
                  email: widget.email,
                  name: widget.name,
                )),
      );
    }
    if (index == 1) {
      // Profil sayfası indeksi
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletPage()),
      );
    }
    // Diğer indeksler için yönlendirmeler ekleyebilirsiniz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loyalty Programs'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSlider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildSearchBar(),
            ),
            _buildButtonGrid(context),
            // const Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Text(
            //     'Populer Programlar',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // _buildSuscribedLoyaltyProgramList(),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     'All Loyalty Programs',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // _buildLoyaltyProgramList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildImageSlider() {
    // Carousel Slider widget'ı
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: [
        'assets/online-loyalty-program-examples.png',
        'assets/Loyalty_1-1.png',
        'assets/customer-loyalty-survey-featured-image-scaled.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(i, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildSearchBar() {
    // Arama çubuğu widget'ı
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search programs',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildButtonGrid(BuildContext context) {
    // Butonlar ve ikonlar için başlıklar ve ikonlar
    final List<Map<String, dynamic>> buttons = [
      {
        'title': 'Tüm Programlar',
        'icon': Icons.apps,
        'color': Colors.blue,
        'onPressed': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoyaltyProgramsPage()),
          );
          //Tüm Programlar sayfasına yönlendirme
        },
      },
      {
        'title': 'Kayıtlı Olduğum Programlar',
        'icon': Icons.star,
        'color': Colors.amber,
        'onPressed': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubscribedProgramsPage()),
          );
          // Tüm Programlar sayfasına yönlendirme
        },
      },
      {
        'title': 'Günün Fırsatları',
        'icon': Icons.local_offer,
        'color': Colors.purple,
        'onPressed': () {
          // Tüm Programlar sayfasına yönlendirme
        },
      },
      {
        'title': 'Ödüllerim',
        'icon': Icons.wallet_giftcard_sharp,
        'color': Colors.green,
        'onPressed': () {
          // Tüm Programlar sayfasına yönlendirme
        },
      },
    ];

    // Butonlar için Grid widget'ı
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10, // Yatay eksende butonlar arası boşluk
      mainAxisSpacing: 10, // Dikey eksende butonlar arası boşluk
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Gridin kaydırılmasını engelle
      childAspectRatio:
          1.5, // Butonların boyut oranını ayarla (genişlik/yükseklik)
      children: buttons.map((button) {
        return Card(
          child: InkWell(
            // InkWell veya GestureDetector kullanarak tıklama işlevselliği ekleyin
            onTap: button['onPressed'], // Butona tıklandığında işlevi çalıştır
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(button['icon'], size: 40, color: button['color']),
                SizedBox(height: 8),
                Text(button['title']),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // _buildLoyaltyProgramList ve _buildSuscribedLoyaltyProgramList aynı kalıyor
  Widget _buildLoyaltyProgramList() {
    // Sadakat programlarını listeleyen widget. Bu örnek için basit bir ListView kullanıyorum.
    return Container(
      height: 200, // Listelenin yüksekliğini ayarlayın
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10, // Gerçek uygulamada bu sayı dinamik olmalı
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 150, // Kartların genişliği
              child: Center(child: Text('Program ${index + 1}')),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuscribedLoyaltyProgramList() {
    // Sadakat programlarını listeleyen widget. Bu örnek için basit bir ListView kullanıyorum.
    return Container(
      height: 150, // Listelenin yüksekliğini ayarlayın
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Gerçek uygulamada bu sayı dinamik olmalı
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 150, // Kartların genişliği
              child: Center(child: Text('Program ${index + 1}')),
            ),
          );
        },
      ),
    );
  }
}
