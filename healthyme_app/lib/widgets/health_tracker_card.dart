import 'package:flutter/material.dart';
import '../main.dart';

class HealthTrackerCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final String? unit;
  final double? progress;
  final String? badgeText;

  const HealthTrackerCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.unit,
    this.progress,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(icon, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (unit != null)
                  TextSpan(
                    text: ' $unit',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (progress != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress!.clamp(0.0, 1.0),
                minHeight: 6,
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          if (badgeText != null)
            Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badgeText!,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}
