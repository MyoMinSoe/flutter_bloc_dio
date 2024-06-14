import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_with_dio/model/user.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<User> userList;
  const UserLoaded(this.userList);
  @override
  List<Object?> get props => [userList];
}

class UserError extends UserState {
  final String error;
  const UserError(this.error);
  @override
  List<Object?> get props => [error];
}
