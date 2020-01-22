import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  @override
  UsersState get initialState => InitialUsersState();

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {

    if(event is GetUsers){
      yield LoadingUsersState();
      try{
        var response = await http.get('https://jsonplaceholder.typicode.com/users');

        List list = json.decode(response.body);

        yield UsersLoadedState(list);
      } catch (e){
        yield ErrorLoadingState('Error Loading users list.');
      }

    }

    if(event is GetUserDetails){
      yield LoadingUsersState();

      try{
        var response = await http.get('https://jsonplaceholder.typicode.com/users/${event.id}');
        Map map = json.decode(response.body);

        yield UserDetailsLoadedState(map);
      } catch (e){
        yield ErrorLoadingState('Error Loading user details.');
      }
    }
  }
}
