import 'package:test_alder_tech/features/auth/domain/entity/user_entity.dart';

class UserInfoModel extends UserEntity {
  const UserInfoModel(super.token);

  factory UserInfoModel.fromjson(Map<String, dynamic> json) {
    return UserInfoModel(json['token']);
  }
}
