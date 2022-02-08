// import 'package:project/bloc/home_screen/home_screen_bloc.dart';
// import 'package:project/bloc/login_screen/login_screen_bloc.dart';
// import 'package:project/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:project/core/network/custom_dio.dart';
import 'package:project/data/local/repository/locale_repository.dart';
import 'package:project/data/local/repository/notification_local_repository.dart';
import 'package:project/data/local/repository/sample_quotable_local_repository.dart';
import 'package:project/data/remote/api/rest_api_client.dart';
import 'package:project/data/remote/mapper/sample_quotable_dto_mapper.dart';
import 'package:project/data/remote/repository/sample_quotable_repository_impl.dart';
import 'package:project/domain/repositories/sample_quotable_repository.dart';
import 'package:project/presentation/res/strings/app_strings/app_strings.dart';
import 'package:get_it/get_it.dart';
import 'package:project/presentation/ui/pages/0_bloc_example/example_bloc/example_bloc.dart';

//sl - service locator
final sl = GetIt.instance;

Future<void> init() async {
  //core network custom dio
  sl.registerLazySingleton(() => CustomDio());

  // data remote rest api
  sl.registerLazySingleton(() => RestApiClient(sl(), baseUrl: AppStrings.get()?.BASE_URL));

  // data remote mapper
  //sl.registerLazySingleton(() => NotificationLocalMapper());
  sl.registerLazySingleton(() => SampleQuotableResultsDTOMapper());
  sl.registerLazySingleton(() => SampleQuotableDTOMapper(sl()));

  // data local repositories
  sl.registerLazySingleton<SampleQuotableLocalRepository>(() => SampleQuotableLocalRepositoryImpl());
  sl.registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl());
  sl.registerLazySingleton<NotificationLocalRepository>(() => NotificationLocalRepositoryImpl());

  // data remote repositories
  // sl.registerLazySingleton<SampleRepository>(() => SampleRepositoryImpl(api: sl()));
  sl.registerLazySingleton<SampleQuotableRepository>(() => SampleQuotableRepositoryImpl(api: sl(), sampleQuotableDTOMapper: sl()));
  /*
  // Bloc
  // splash screen bloc
  sl.registerFactory(
    () => SplashScreenBloc(),
  );

  // login screen bloc
  sl.registerFactory(
    () => LoginScreenBloc(sampleRepository: sl(), sampleQuotableLocalRepository: sl()),
  );

  // home screen bloc
  sl.registerFactory(
    () => HomeScreenBloc(),
  );*/
  // example screen bloc
  sl.registerFactory(
    () => ExampleBloc(),
  );
}
