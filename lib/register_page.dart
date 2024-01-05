import 'package:flutter/material.dart';

import 'main.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                const SizedBox(height: 20),
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(hint: 'Name', obscure: false),
                const SizedBox(height: 10),
                _buildTextField(hint: 'Email', obscure: false),
                const SizedBox(height: 10),
                _buildTextField(hint: 'Password', obscure: true),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement registration logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // Button color
                    onPrimary: Colors.white, // Text color
                    minimumSize: const Size(double.infinity, 60), // Button size
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required bool obscure}) {
    return TextField(
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
}
