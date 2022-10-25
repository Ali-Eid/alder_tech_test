import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String token;

  const UserEntity(this.token);
  @override
  List<Object?> get props => [];
}
