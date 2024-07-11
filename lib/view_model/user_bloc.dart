import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';
import '../respository/api_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;
  UserBloc(this.apiService) : super(UserInitial()) {
    on((event, emit) async {
      int skip = 0;
      List<User> userList = [];

      emit(const UserLoading());

      UserModel? userModelList = await apiService.fetchUserList(skip);

      while (userList.length != userModelList!.total) {
        var temp = userModelList.users;
        userList.addAll(temp);
        skip = userModelList.skip + userModelList.limit;
        userModelList = await apiService.fetchUserList(skip);
      }

      try {
        emit(UserLoaded(userList));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
