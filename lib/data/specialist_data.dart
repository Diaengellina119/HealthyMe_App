import 'package:flutter/material.dart';
import '../models/specialist_model.dart';

/// Daftar 9 spesialis dokter 
final List<SpecialistModel> specialistList = [
  const SpecialistModel(name: 'Dokter Umum', imagePath: 'assets/icons/umum.png'),
  const SpecialistModel(name: 'Anak', imagePath: 'assets/icons/anak.png'),
  const SpecialistModel(name: 'Kulit', imagePath: 'assets/icons/kulit.png'),
  const SpecialistModel(name: 'Penyakit Dalam', imagePath: 'assets/icons/penyakit_dalam.png'),
  const SpecialistModel(name: 'THT', imagePath: 'assets/icons/tht.png'),
  const SpecialistModel(name: 'Kandungan', imagePath: 'assets/icons/kandungan.png'),
  const SpecialistModel(name: 'Paru-Paru', imagePath: 'assets/icons/paru_paru.png'),
  const SpecialistModel(name: 'Psikologi', imagePath: 'assets/icons/psikis.png'),
  const SpecialistModel(name: 'Lainnya', isMore: true),
];

/// Daftar "Spesialis Populer Lainnya".
final List<PopularSpecialistModel> popularSpecialistList = [
  const PopularSpecialistModel(
    title: 'Infeksi Pernapasan',
    imagePath: 'assets/icons/infeksi_pernapasan.png',
    borderColor: Color(0xFF0C103E),
  ),
  const PopularSpecialistModel(
    title: 'Bapil Anak',
    imagePath: 'assets/icons/bapil_anak.png',
    borderColor: Color(0xFF0C103E),
  ),
  const PopularSpecialistModel(
    title: 'Eksim',
    imagePath: 'assets/icons/eksim.png',
    borderColor: Color(0xFF0C103E),
  ),
  const PopularSpecialistModel(
    title: 'Infeksi Mata',
    imagePath: 'assets/icons/infeksi_mata.png',
    borderColor: Color(0xFF0C103E),
  ),
];
