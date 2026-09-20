import 'package:flutter/material.dart';

/// Model untuk satu item spesialis dokter di grid.
class SpecialistModel {
  final String name;
  final String imagePath;
  final bool isMore; 

  const SpecialistModel({
    required this.name,
    this.imagePath = '',
    this.isMore = false,
  });
}

/// Model untuk item di section "Spesialis Populer Lainnya".
class PopularSpecialistModel {
  final String title;
  final String imagePath;
  final Color borderColor;

  const PopularSpecialistModel({
    required this.title,
    required this.imagePath,
    required this.borderColor,
  });
}
