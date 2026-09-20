import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/home_screen.dart';
import '../screen/settings_screen.dart';

void main() {
  runApp(const HealthyMeApp());
}

class AppColors {
  static const Color primary = Color(0xFF5B85D9);
  static const Color primaryLight = Color(0xFFF0F4FD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF999BA7);
  static const Color dark = Color(0xFF0C103F);
}

class HealthyMeApp extends StatelessWidget {
  const HealthyMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        fontFamily:
            GoogleFonts.leagueSpartan(fontWeight: FontWeight.w400).fontFamily,
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          ThemeData.light().textTheme.apply(
                bodyColor: AppColors.dark,
                displayColor: AppColors.dark,
              ),
        ).copyWith(
          displayLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          displayMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          displaySmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          headlineLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          headlineMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          headlineSmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          titleLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          titleMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          titleSmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          bodyLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          bodyMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          bodySmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          labelLarge: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          labelMedium: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
          labelSmall: GoogleFonts.leagueSpartan(
              fontWeight: FontWeight.w400, color: AppColors.dark),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.primary),
          titleTextStyle: GoogleFonts.leagueSpartan(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const RootNavigation(),
    );
  }
}

class RootNavigation extends StatefulWidget {
  const RootNavigation({super.key});

  @override
  State<RootNavigation> createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  int _currentIndex = 0;

  Widget _placeholderPage(String title, IconData icon) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: AppColors.primary.withOpacity(0.4)),
            const SizedBox(height: 12),
            Text(
              '$title Screen',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _pages => [
        const HomeScreen(),
        _placeholderPage('Chat', Icons.chat_bubble_outline),
        _placeholderPage('History', Icons.history),
        const SettingsScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.35),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.6),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontSize: 11),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                activeIcon: Icon(Icons.chat_bubble),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                activeIcon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
