import 'dart:convert';

import 'package:test_alder_tech/core/constants.dart';
import 'package:test_alder_tech/core/error/exciptions.dart';
import 'package:test_alder_tech/features/auth/data/model/user_info_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserInfoModel> loginAsGuest();
  Future<String> getPolicy();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);
  @override
  Future<UserInfoModel> loginAsGuest() async {
    try {
      final response = await client.get(Uri.parse('${url}auth/guest'),
          headers: {'secret': '5c06e532488792fc87019c315edc6150'});
      if (response.statusCode == 200) {
        final jsondecode = json.decode(response.body) as Map<String, dynamic>;
        UserInfoModel userInfoModel = UserInfoModel.fromjson(jsondecode);
        return userInfoModel;
      } else {
        throw ServerExciption();
      }
    } catch (e) {
      throw ServerExciption();
    }
  }

  @override
  Future<String> getPolicy() async {
    try {
      final response = await client.get(Uri.parse('${url}appTerm/policy'),
          headers: {'secret': '5c06e532488792fc87019c315edc6150'});
      if (response.statusCode == 200) {
        final jsondecode = json.decode(response.body) as Map<String, dynamic>;
        final String policy = jsondecode['policy'];
        return policy;
      } else {
        throw ServerExciption();
      }
    } catch (e) {
      print(e.toString());
      throw ServerExciption();
    }
  }
}
