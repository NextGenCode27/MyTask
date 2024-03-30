import 'package:get_it/get_it.dart';
import 'package:my_task/core/themes/data/data_source/local/theme_local_datasource.dart';
import 'package:my_task/core/themes/data/repository/theme_repository_impl.dart';
import 'package:my_task/core/themes/domain/repository/them_repository.dart';
import 'package:my_task/core/themes/domain/usecase/get_theme_usecase.dart';
import 'package:my_task/core/themes/domain/usecase/set_theme_usecase.dart';
import 'package:my_task/core/themes/theme_bloc/theme_bloc.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> iniDependencies() async {
  _initTheme();
}

_initTheme() {
  serviceLocator
    ..registerFactory<ThemeLocalDatasource>(
      () => ThemeLocalDatasourceImpl(),
    )
    ..registerFactory<ThemeRepository>(
      () => ThemeRepositoryImpl(serviceLocator()),
    )
    ..registerFactory<SetThemeUsecase>(
      () => SetThemeUsecase(serviceLocator()),
    )
    ..registerFactory(
      () => GetThemeUsecase(serviceLocator()),
    )
    ..registerLazySingleton<ThemeBloc>(
      () => ThemeBloc(
        setThemeUsecase: serviceLocator(),
        getThemeUsecase: serviceLocator(),
      ),
    );
}
