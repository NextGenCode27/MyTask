import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/core/global_features/user/domain/entity/user_entity.dart';
import 'package:my_task/core/global_features/user/domain/usecase/get_userdata_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserDataUsecase _getCurrentUserDataUsecase;
  UserBloc({required GetCurrentUserDataUsecase getCurrentUserDataUsecase})
      : _getCurrentUserDataUsecase = getCurrentUserDataUsecase,
        super(UserInitial()) {
    on<GetCurrentUserDataEvent>(_mapGetCurrentUserDataEventToMap);
  }

  FutureOr<void> _mapGetCurrentUserDataEventToMap(
      GetCurrentUserDataEvent event, Emitter<UserState> emit) async {
    final res = await _getCurrentUserDataUsecase.call(NoParams());

    res.fold(
      (error) => emit(UserFailed(message: error.message)),
      (user) => emit(UserSuccess(userEntity: user)),
    );
  }
}
