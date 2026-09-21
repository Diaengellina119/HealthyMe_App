import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
import 'register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan image
            Image.asset(
              'assets/images/Logo-blue.png',
              width: 33,
              height: 52,
            ),
            // Tambah ruang antara image dan teks
            const SizedBox(height: 12),
            // Ubah styling teks pakai Gfonts
            Text(
              'HealtyMe',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              'Selamat Datang di HealtyMe',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Image.asset(
              'assets/images/storyboard.png',
              width: 360,
              height: 334,
            ),
            // Salin style ke text dibawah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Pantau kondisi tubuh, konsultasi dengan dokter spesialis, hingga pesan obat-semua kebutuhan kesehatanmu kini lebih mudah dalam satu genggaman.',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
            // Tambah Ruang
            const SizedBox(height: 11),
            // Tombol Sign Up
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C85D9),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(327.0, 45.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  textStyle: GoogleFonts.plusJakartaSans(fontSize: 24.0)),
            ),
            const SizedBox(height: 14),
            // Tombol Login
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Log In'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF5C85D9),
                minimumSize: const Size(327.0, 45.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                textStyle: GoogleFonts.plusJakartaSans(fontSize: 24.0),
                side: const BorderSide(color: Color(0xFF5C85D9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
