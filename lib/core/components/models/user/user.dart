class UserModel {
  final String name;
  final String password;
  UserModel({
    required this.name,
    required this.password,
  });
  String get fullName => '$name $password';

  factory UserModel.fake() {
    return UserModel(name: 'eve.holt@reqres.in', password: 'cityslicka');
  }
}
