import 'package:flutter/material.dart';
import 'package:loyalty_app/login_firm_page.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp(MyApp());
}

class AppColors {
  static const Color primaryColor = Color(0xFFA020F0); // Starbucks Yeşili gibi
  static const Color backgroundColor = Color(0xFFFAE6FA); // Gri ton
  // Diğer renklerinizi de burada tanımlayabilirsiniz.
}

class HexColor {
  const HexColor();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loyalty Program App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Starbucks green background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your logo can go here
              Image.asset('assets/logo.png', width: 400),
              SizedBox(height: 20),
              const Text(
                'Welcome to Loyalty SuperApp',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              const Text(
                'Please Sign-in or create an account',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),

              SizedBox(height: 50),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Login as User'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // Button color
                    onPrimary: Colors.white, // Text color
                    minimumSize: Size(double.infinity, 60)),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Login as Firm'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginFirmPage()),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // Button color
                    onPrimary: Colors.white, // Text color
                    minimumSize: Size(double.infinity, 60)),
              ),
              SizedBox(height: 20),
              OutlinedButton.icon(
                icon: const Icon(Icons.app_registration),
                label: const Text('Register'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                  side: const BorderSide(
                      color: AppColors.primaryColor), // Border color
                  minimumSize: Size(double.infinity, 60),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
