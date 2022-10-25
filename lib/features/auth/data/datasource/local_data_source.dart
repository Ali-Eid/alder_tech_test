import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<Unit> cachedToken(String token);
  Future<String> getcachedToken();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl(this.sharedPreferences);
  @override
  Future<Unit> cachedToken(String token) async {
    await sharedPreferences.setString('token', token);
    return Future.value(unit);
  }

  @override
  Future<String> getcachedToken() async {
    String? sharedPreferencesToken = sharedPreferences.getString('token');
    if (sharedPreferencesToken != null) {
      return sharedPreferencesToken;
    } else {
      return Future.value(null);
    }
  }
}
