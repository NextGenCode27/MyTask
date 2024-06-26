import 'package:get_it/get_it.dart';
import 'package:my_task/core/secrets/supabse_secrets.dart';
import 'package:my_task/core/global_features/themes/data/data_source/local/theme_local_datasource.dart';
import 'package:my_task/core/global_features/themes/data/repository/theme_repository_impl.dart';
import 'package:my_task/core/global_features/themes/domain/repository/them_repository.dart';
import 'package:my_task/core/global_features/themes/domain/usecase/get_theme_usecase.dart';
import 'package:my_task/core/global_features/themes/domain/usecase/set_theme_usecase.dart';
import 'package:my_task/core/global_features/themes/presentation/theme_bloc/theme_bloc.dart';
import 'package:my_task/core/global_features/user/bloc/user_bloc.dart';
import 'package:my_task/core/global_features/user/data/data_source/remote/user_remote_datasource.dart';
import 'package:my_task/core/global_features/user/data/repository/user_repository_impl.dart';
import 'package:my_task/core/global_features/user/domain/repository/user_repository.dart';
import 'package:my_task/core/global_features/user/domain/usecase/get_userdata_usecase.dart';
import 'package:my_task/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:my_task/features/auth/data/repository/auth_repository_impl.dart';
import 'package:my_task/features/auth/domain/repository/auth_repository.dart';
import 'package:my_task/features/auth/domain/usecase/login_usecase.dart';
import 'package:my_task/features/auth/domain/usecase/logout_usecase.dart';
import 'package:my_task/features/auth/domain/usecase/register_usecase.dart';
import 'package:my_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_task/features/tasks/data/data_source/remote/task_remote_datasource.dart';
import 'package:my_task/features/tasks/data/repository/task_repository_impl.dart';
import 'package:my_task/features/tasks/domain/repository/task_repository.dart';
import 'package:my_task/features/tasks/domain/usecase/add_task_usecase.dart';
import 'package:my_task/features/tasks/domain/usecase/fetch_task.dart';
import 'package:my_task/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> iniDependencies() async {
  _initTheme();
  _initAuth();
  _initHome();
  _initUser();
  _addTaskInit();
  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  serviceLocator.registerFactory<SupabaseClient>(() => supabase.client);
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

_initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDatasource: serviceLocator()),
    )
    ..registerFactory<LoginUsecase>(
      () => LoginUsecase(authRepository: serviceLocator()),
    )
    ..registerFactory<RegisterUsecas>(
      () => RegisterUsecas(authRepository: serviceLocator()),
    )
    ..registerFactory<LogOutUsecase>(
      () => LogOutUsecase(authRepository: serviceLocator()),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        loginUsecase: serviceLocator(),
        registerUsecas: serviceLocator(),
        logOutUsecase: serviceLocator(),
        supabaseClient: serviceLocator(),
      ),
    );
}

_initHome() {
  serviceLocator.registerLazySingleton<HomeBloc>(
    () => HomeBloc(),
  );
}

_initUser() {
  serviceLocator
    ..registerFactory<UserRemoteDatasource>(
      () => UserRemoteDatasourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<UserRepository>(
      () => UserRepositoryImpl(userRemoteDatasource: serviceLocator()),
    )
    ..registerFactory<GetCurrentUserDataUsecase>(
      () => GetCurrentUserDataUsecase(userRepository: serviceLocator()),
    )
    ..registerLazySingleton<UserBloc>(
      () => UserBloc(getCurrentUserDataUsecase: serviceLocator()),
    );
}

_addTaskInit() {
  serviceLocator
    ..registerFactory<TaskRemoteDatasource>(
      () => TaskRemoteDatasourceImpl(supabaseClient: serviceLocator()),
    )
    ..registerFactory<TaskRepository>(
      () => TaskRepositoryImpl(
        taskRemoteDatasource: serviceLocator(),
        supabaseClient: serviceLocator(),
      ),
    )
    ..registerFactory<AddTaskUsecase>(
      () => AddTaskUsecase(taskRepository: serviceLocator()),
    )
    ..registerFactory<FetchTaskUsecase>(
      () => FetchTaskUsecase(taskRepository: serviceLocator()),
    )
    ..registerLazySingleton<TaskBloc>(
      () => TaskBloc(
        addTaskUsecase: serviceLocator(),
        fetchTaskUsecase: serviceLocator(),
        fetchCurrentUserTaskUsecase: serviceLocator(),
      ),
    );
}
