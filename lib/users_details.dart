import 'package:blocwithhttp/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersDetails extends StatelessWidget {

  final int id;

  UsersDetails({@required this.id});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => UsersBloc() ..add(GetUserDetails(this.id)),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bloc With Http Demo'),
          ),
          body: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state){
              if(state is LoadingUsersState){
                return CircularProgressIndicator();
              }

              if(state is UserDetailsLoadedState){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('Name: '),
                          Text(state.map['name'])
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('User Name: '),
                          Text(state.map['username']),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('Email: '),
                          Text(state.map['email']),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('Phone: '),
                          Text(state.map['phone']),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('Website: '),
                          Text(state.map['website']),
                        ],
                      ),
                    ),
                  ],
                );
              }

              if(state is ErrorLoadingState){
                return Center(
                  child: Text(state.message),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
