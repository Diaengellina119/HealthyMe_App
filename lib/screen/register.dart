import 'package:flutter/material.dart';
import '../main.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Variabel untuk show/hide password
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF5C86E5),
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'New Account',
          style: TextStyle(
            color: Color(0xFF1B1E3D),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 5 Form Input
            _buildInput('Full name', 'example@example.com'),
            _buildInput('Password', '**************', isPassword: true),
            _buildInput('Email', 'example@example.com'),
            _buildInput('Mobile Number', 'example@example.com'),
            _buildInput('Date Of Birth', 'DD / MM /YYY'),
            const SizedBox(height: 15),

            // Teks Persetujuan Ketentuan
            const Center(
              child: Text.rich(
                TextSpan(
                  text: 'By continuing, you agree to\n',
                  style: TextStyle(color: Colors.black87, fontSize: 11),
                  children: [
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(color: Color(0xFF5C86E5)),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(color: Color(0xFF5C86E5)),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),

            // Tombol Sign Up
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RootNavigation()), // ganti ke ini
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C86E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Teks or sign up with
            const Center(
              child: Text(
                'or sign up with',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
            ),
            const SizedBox(height: 15),

            // Tombol Sosial Media (Google, Facebook, Fingerprint)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialCircle(
                  child: const Text(
                    'G',
                    style: TextStyle(
                      color: Color(0xFF5C86E5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                _buildSocialCircle(
                  child: const Text(
                    'f',
                    style: TextStyle(
                      color: Color(0xFF5C86E5),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                _buildSocialCircle(
                  child: const Icon(
                    Icons.fingerprint,
                    color: Color(0xFF5C86E5),
                    size: 26,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Footer: already have an account? Log in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have an account? ',
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Color(0xFF5C86E5),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  // Fungsi bantuan input agar kodenya tidak berulang-ulang
  Widget _buildInput(String label, String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF4FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              obscureText: isPassword ? _obscurePassword : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF93A8E8),
                  fontSize: 15,
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black54,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi bantuan lingkaran sosmed
  Widget _buildSocialCircle({required Widget child}) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: Color(0xFFD8E5FE),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
