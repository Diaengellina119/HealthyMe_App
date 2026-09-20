class DoctorModel {
  final String name;
  final String specialty;
  final String experience;
  final String price;
  final double rating;
  final String reviewCount;
  final String imagePath;

  const DoctorModel({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
  });
}