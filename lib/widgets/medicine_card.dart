// widgets/medicine_card.dart
import 'package:flutter/material.dart';
import '../main.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageAsset;
  final VoidCallback? onTap;

  const MedicineCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 106,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(
                imageAsset,
                width: 106,
                height: 89,
                fit: BoxFit.cover,
                cacheWidth: 212,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.dark, fontSize: 11),
            ),
            const SizedBox(height: 2),
            Text(
              price,
              style: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
