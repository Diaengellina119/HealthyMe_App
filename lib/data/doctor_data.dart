import '../models/doctor_model.dart';

final List<DoctorModel> doctorList = List.generate(
  7,
  (index) => const DoctorModel(
    name: 'Dr. Alexander Bennett, Ph.D.',
    specialty: 'Dokter Umum',
    experience: '12 tahun',
    price: 'Rp20.000,00',
    rating: 4.7,
    reviewCount: '1k+ Ulasan',
    imagePath: 'assets/icons/docter_img.jpg', 
  ),
);