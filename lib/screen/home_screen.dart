import 'package:flutter/material.dart';
import '../main.dart';
import '../screen/profile_screen.dart';
import '../widgets/quick_action_item.dart';
import '../widgets/health_tracker_card.dart';
import '../widgets/article_card.dart';
import 'chat_dengan_dokter_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> _quickActions = [
    {'icon': 'assets/icons/doctors.svg', 'label': 'Doctors'},
    {'icon': 'assets/icons/medicine.svg', 'label': 'Medicine'},
    {'icon': 'assets/icons/ambulance.svg', 'label': 'Ambulance'},
    {'icon': 'assets/icons/hospital.svg', 'label': 'Hospital'},
    {'icon': 'assets/icons/medical_record.svg', 'label': 'Medical\nRecords'},
    {'icon': 'assets/icons/appointment.svg', 'label': 'Appointment'},
    {
      'icon': 'assets/icons/lab_and_medical_service.svg',
      'label': 'Lab And\nMedical Service'
    },
  ];

  static const List<Map<String, String>> _articles = [
    {
      'title': 'Rajin Olahraga Membantu Cegah Berbagai Penyakit di Usia Senja',
      'desc': 'Cek olahraga apa saja yang cocok untuk usia anda',
      'image': 'assets/images/article_cover_1.png',
    },
    {
      'title': 'Perbanyak Buah dan Sayur agar Pencernaan Lancar',
      'desc':
          'Sistem Pencernaan yang lancar tidak hanya berpaku pada pola hidup sehat, namun juga menjaga asupan vitamin dan mineral sesuai kebutuhan',
      'image': 'assets/images/article_cover_2.jpg',
    },
    {
      'title': 'Tips Menjaga Pola Makan',
      'desc':
          'Cara sederhana menjaga pola makan sehat di tengah kesibukan sehari-hari.',
      'image': 'assets/images/article_cover_3.jpg',
    },
  ];

  static const double _waterValue = 1.8;
  static const double _waterTarget = 2.5;
  static const int _stepsValue = 6420;
  static const int _stepsTarget = 10000;
  static const String _glucoseValue = '98';
  static const String _pressureValue = '120/80';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildAppointmentBanner(),
            const SizedBox(height: 16),
            _buildQuickActionsGrid(),
            const SizedBox(height: 20),
            _buildHealthTrackerSection(),
            const SizedBox(height: 20),
            _buildArticleSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          },
          child: ClipOval(
            child: Image.asset(
              'assets/images/photo_profile_john.png',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Welcome Back',
                  style: TextStyle(fontSize: 11, color: AppColors.primary)),
              Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark),
              ),
            ],
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.notifications_none,
                  color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 12, color: AppColors.dark),
                children: [
                  TextSpan(text: 'Today you have one appointment with\n'),
                  TextSpan(
                    text: 'Dr. Olivia Turner, M.D.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(18),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _quickActions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 14,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = _quickActions[index];
          return QuickActionItem(
            iconAsset: item['icon']!,
            label: item['label']!,
            onTap: item['label'] == 'Doctors'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatDenganDokterScreen(),
                      ),
                    );
                  }
                : null,
          );
        },
      ),
    );
  }

  Widget _buildHealthTrackerSection() {
    final double waterProgress = _waterValue / _waterTarget;
    final double stepsProgress = _stepsValue / _stepsTarget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Health Tracker',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Today',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: HealthTrackerCard(
                title: 'Water Intake',
                iconAsset: 'assets/icons/water_intake.svg',
                value: _waterValue.toString(),
                unit: '/ ${_waterTarget}L',
                progress: waterProgress,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: HealthTrackerCard(
                title: 'Steps',
                iconAsset: 'assets/icons/steps.svg',
                value: _stepsValue.toString(),
                unit: 'steps',
                progress: stepsProgress,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: HealthTrackerCard(
                title: 'Blood Glucose',
                iconAsset: 'assets/icons/blood_glucose.svg',
                value: _glucoseValue,
                unit: 'mg/dL',
                badgeText: 'Normal',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: HealthTrackerCard(
                title: 'Blood Pressure',
                iconAsset: 'assets/icons/blood_pressure.svg',
                value: _pressureValue,
                unit: 'mmHg',
                badgeText: 'Optimal',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArticleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Article',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.dark),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _articles.length,
            itemBuilder: (context, index) {
              final article = _articles[index];
              return ArticleCard(
                title: article['title']!,
                description: article['desc']!,
                imageAsset: article['image']!,
              );
            },
          ),
        ),
      ],
    );
  }
}
