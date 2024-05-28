import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_dio/model/user.dart';
import 'package:flutter_bloc_with_dio/respository/api_service.dart';
import 'package:flutter_bloc_with_dio/view_model/user_event.dart';
import 'package:flutter_bloc_with_dio/view_model/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;
  UserBloc(this.apiService) : super(UserInitial()) {
    on((event, emit) async {
      int skip = 0;
      List<User> userList = [];
      UserModel? userModelList = await apiService.fetchUserList(skip);

      while (userList.length != userModelList!.total) {
        emit(UserLoading(skip));
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
