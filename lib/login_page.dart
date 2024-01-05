import 'package:flutter/material.dart';
import 'package:loyalty_app/home_page_personal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                    hint: 'Email',
                    obscure: false,
                    controller: _usernameController),
                const SizedBox(height: 10),
                _buildTextField(
                    hint: 'Password',
                    obscure: true,
                    controller: _passwordController),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => {
                    _login(context, _usernameController.text,
                        _passwordController.text)
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // Button color
                    onPrimary: Colors.white, // Text color
                    minimumSize: Size(double.infinity, 60), //Button size
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // TODO: Implement "Forgot Password" logic
                    print("Oh I forgot my password");
                  },
                  child: const Text('Forgot Password?',
                      style: TextStyle(color: AppColors.primaryColor)),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: AppColors.primaryColor,
      ),
    );
  }

  Future<void> _login(
      BuildContext context, String username, String password) async {
    var url = Uri.parse('http://localhost:60805/api/Auth/Login'); // Backend URL

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': username,
          'password': password,
          'authenticatorCode': 'string' // Bu alan gerekiyorsa
        }),
      );

      if (response.statusCode == 200) {
        // İstek başarılı
        var data = json.decode(response.body);
        String token = data['accessToken']['token'];
        var payloadMap = _decodeJwtPayload(token);
        print(payloadMap);

        String userId = payloadMap[
            "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
        String email = payloadMap["email"];
        String name = payloadMap[
            "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage(userId: userId, email: email, name: name)),
        );
        print(data);
      } else {
        // Hata işleme
        print('Failed to login with status code: ${response.statusCode}');
        // Kullanıcıya hata mesajı gösterilebilir
      }
    } catch (e) {
      // Ağ veya diğer hataları yakalama
      print('Error: $e');
      // Kullanıcıya hata mesajı gösterilebilir
    }
  }

  Widget _buildTextField(
      {required String hint,
      required bool obscure,
      required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscure,
    );
  }

  Map<String, dynamic> _decodeJwtPayload(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final normalizedBase64Str = base64.normalize(payload);
    final decodedStr = utf8.decode(base64.decode(normalizedBase64Str));
    return json.decode(decodedStr) as Map<String, dynamic>;
  }
}
