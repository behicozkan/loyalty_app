import 'package:flutter/material.dart';
import 'main.dart'; // AppColors ve diğer gereken tanımlamalar için

class ProfilePage extends StatelessWidget {
  final String userId;
  final String email;
  final String name;

  ProfilePage(
      {Key? key, required this.userId, required this.email, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilim'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            // _buildLoyaltyPointsSection(),
            _buildActivitySection(),
            _buildSettingsSection(context),
            _buildSupportSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/pofile.png'),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(email),
                TextButton(
                  onPressed: () {
                    // Profili düzenleme sayfasına yönlendirme
                  },
                  child: Text('Profili Düzenle'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoyaltyPointsSection() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sadakat Puanları',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Mevcut Puanlarınız: 1230'),
            // Daha fazla detay ve işlevsellik eklenebilir
          ],
        ),
      ),
    );
  }

  Widget _buildActivitySection() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.history),
            title: Text('İşlem Geçmişi'),
            subtitle: Text('Son alışverişleriniz ve etkinlikleriniz'),
            onTap: () {
              // İşlem geçmişi sayfasına yönlendirme
            },
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  // İşlem geçmişi detay sayfasına yönlendirme
                },
                child: Text('Tüm İşlemleri Gör'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ayarlar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Bildirim Ayarları'),
              onTap: () {
                // Bildirim ayarları sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Güvenlik Ayarları'),
              onTap: () {
                // Güvenlik ayarları sayfasına yönlendirme
              },
            ),
            // Diğer ayarlar...
          ],
        ),
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Destek ve Yardım',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('SSS'),
              onTap: () {
                // SSS sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text('Müşteri Hizmetleri'),
              onTap: () {
                // Müşteri hizmetleri ile iletişime geçme
              },
            ),
            // Diğer destek seçenekleri...
          ],
        ),
      ),
    );
  }
}
