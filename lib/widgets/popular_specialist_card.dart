import 'package:flutter/material.dart';
import '../models/specialist_model.dart';

class PopularSpecialistCard extends StatelessWidget {
  final PopularSpecialistModel data;
  final VoidCallback? onTap;

  const PopularSpecialistCard({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: data.borderColor, width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.5),
                child: Image.asset(
                  data.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}