import 'package:flutter/material.dart';
import '../models/specialist_model.dart';

class SpecialistCard extends StatelessWidget {
  final SpecialistModel data;
  final VoidCallback? onTap;

  const SpecialistCard({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    const double radius = 16; 

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: Color(0xFF0C103E), width: 1.5),
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius - 1.5), 
              child: data.isMore
                  ? const Center(
                      child: Icon(Icons.more_horiz, size: 28, color: Color(0xFF0C103E)),
                    )
                  : Image.asset(
                      data.imagePath,
                      fit: BoxFit.cover, 
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}