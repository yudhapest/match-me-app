class User {
  final String fullName;
  final int age;
  final String occupation;
  final String imagePath;
  final String description;
  final List<String> hobbyImages; // Properti baru untuk daftar gambar hobi

  User({
    required this.fullName,
    required this.age,
    required this.occupation,
    required this.imagePath,
    required this.description,
    required this.hobbyImages, // Inisialisasi properti hobbyImages
  });
}
