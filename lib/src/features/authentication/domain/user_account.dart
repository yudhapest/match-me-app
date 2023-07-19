import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAccount {
  final String fullName;
  final String email;
  final String passwornd;
  final String occupation;
  final String age;
  String? imagePath;

  UserAccount({
    required this.fullName,
    required this.email,
    required this.passwornd,
    required this.occupation,
    required this.age,
    this.imagePath,
  });

  @override
  String toString() {
    return 'UserAccount(fullName: $fullName, email: $email, passwornd: $passwornd, occupation: $occupation, age: $age, imagePath: $imagePath)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'email': email,
      'passwornd': passwornd,
      'occupation': occupation,
      'age': age,
      'imagePath': imagePath,
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      passwornd: map['passwornd'] as String,
      occupation: map['occupation'] as String,
      age: map['age'] as String,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserAccount other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.email == email &&
        other.passwornd == passwornd &&
        other.occupation == occupation &&
        other.age == age &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        email.hashCode ^
        passwornd.hashCode ^
        occupation.hashCode ^
        age.hashCode ^
        imagePath.hashCode;
  }
}
