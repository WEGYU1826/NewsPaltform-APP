import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? lastName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String? token;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.token});
}
