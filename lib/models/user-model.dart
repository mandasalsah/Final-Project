class UserModel {}

class UserData {}

class UserDetail {
  final int id;
  final String nama;
  final String email;
  final String hp;

  UserDetail({
    required this.id,
    required this.nama,
    required this.email,
    required this.hp,
  });

  // factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(id:,)
}
