import 'package:get_it/get_it.dart';
import 'package:watchcollection/TimeLuxe/data/time_luxe_repo_impl.dart';
import 'package:watchcollection/TimeLuxe/domain/time_luxe_repo.dart';
import 'package:watchcollection/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:watchcollection/features/auth/forgot_password/data/forgot_password_repo_impl.dart';
import 'package:watchcollection/features/auth/forgot_password/domain/forgot_password_repo.dart';
import 'package:watchcollection/features/auth/forgot_password/presentation/cubit/forgot_password_view_cubit.dart';
import 'package:watchcollection/features/auth/sign_in/data/sign_in_repo_impl.dart';
import 'package:watchcollection/features/auth/sign_in/domain/sign_in_repo.dart';
import 'package:watchcollection/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:watchcollection/features/auth/sign_up/domain/sign_up_view_repo.dart';
import 'package:watchcollection/features/auth/sign_up/presentation/cubit/sign_up_view_cubit.dart';

import '../../features/auth/sign_up/data/sign_up_view_repo_impl.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  void setupServiceLocators() {
    serviceLocator.registerLazySingleton<SignInViewRepo>(
      () => SignInViewRepoImpl(),
    );

    serviceLocator.registerFactory<SignInViewCubit>(
      () => SignInViewCubit(serviceLocator.get<SignInViewRepo>()),
    );

    serviceLocator.registerLazySingleton<SignUpViewRepo>(
      () => SignUpViewRepoImpl(),
    );

    serviceLocator.registerFactory<SignUpViewCubit>(
      () => SignUpViewCubit(serviceLocator.get<SignUpViewRepo>()),
    );

    serviceLocator.registerLazySingleton<ForgotPasswordRepo>(
      () => ForgotPasswordRepoImpl(),
    );

    serviceLocator.registerFactory<ForgotPasswordViewCubit>(
      () => ForgotPasswordViewCubit(serviceLocator.get<ForgotPasswordRepo>()),
    );

    serviceLocator.registerLazySingleton<TimeLuxeRepo>(
      () => TimeLuxeRepoImpl(),
    );

    serviceLocator.registerFactory<TimeLuxeCubit>(
      () => TimeLuxeCubit(serviceLocator.get<TimeLuxeRepo>()),
    );
  }
}