class Userd {
  final String name;
  final String id;
  final String email;
  final String password;

  Userd({
    required this.name,
    required this.id,
    required this.email,
    required this.password,
  });

  factory Userd.fromJson(Map<String, dynamic> json) {
    return Userd(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'password': password,
    };
  }
}