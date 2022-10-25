import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_alder_tech/features/auth/data/datasource/local_data_source.dart';
import 'package:test_alder_tech/features/auth/data/datasource/remote_data_source.dart';
import 'package:test_alder_tech/features/auth/data/repository/auth_repository_impl.dart';
import 'package:test_alder_tech/features/auth/domain/usecase/auth_usecase.dart';
import 'package:test_alder_tech/features/auth/domain/usecase/get_policy_usecase.dart';
import 'package:test_alder_tech/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_alder_tech/features/auth/presentation/bloc/policy/policy_bloc.dart';
import 'package:test_alder_tech/features/products/data/datasource/remote_data_source.dart';
import 'package:test_alder_tech/features/products/data/repository/products_repository_impl.dart';
import 'package:test_alder_tech/features/products/domain/usecase/get_products_offset.dart';
import 'package:test_alder_tech/features/products/domain/usecase/get_products_usecase.dart';
import 'package:test_alder_tech/features/products/presentation/bloc/prodcuts/products_bloc.dart';

import 'features/auth/domain/repository/auth_repository.dart';
import 'features/products/domain/repository/products_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //Bloc
  sl.registerFactory(() => AuthBloc(auth: sl()));
  sl.registerFactory(() => PolicyBloc(getPolicy: sl()));
  sl.registerFactory(
      () => ProductsBloc(getProducts: sl(), getProductsOffset: sl()));

  //UseCases
  sl.registerLazySingleton(() => AuthUseCase(sl()));
  sl.registerLazySingleton(() => GetPolicyUseCase(sl()));
  sl.registerLazySingleton(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetProductsOffsetUsecase(sl()));

  //Repository

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(sl()));

  //RemoteDataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(sl()));

  //External

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => sharedPreferences);
}
