import 'package:meta/meta.dart';

@immutable
abstract class UsersState {}

class InitialUsersState extends UsersState {}

class LoadingUsersState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List list;

  UsersLoadedState(this.list);

}

class UserDetailsLoadedState extends UsersState {
  final Map map;

  UserDetailsLoadedState(this.map);
}

class ErrorLoadingState extends UsersState {

  final String message;

  ErrorLoadingState(this.message);
}
