import 'package:meta/meta.dart';

@immutable
abstract class UsersEvent {}

class GetUsers extends UsersEvent {}

class GetUserDetails extends UsersEvent {
  final int id;

  GetUserDetails(this.id);
}