import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/search/data/repos/search_impl_repo.dart';

import '../../features/home/data/repos/home_impl_repo.dart';
import 'api_service.dart';


final   getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
    
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
