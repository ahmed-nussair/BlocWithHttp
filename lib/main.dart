import 'package:blocwithhttp/bloc/bloc.dart';
import 'package:blocwithhttp/users_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * I used the API from this website
 * https://jsonplaceholder.typicode.com/
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: BlocProvider(
          create: (_) => UsersBloc()..add(GetUsers()),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Bloc With Http Demo'),
            ),
            body: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is LoadingUsersState) {
                  return CircularProgressIndicator();
                }

                if (state is UsersLoadedState) {
                  return ListView(
                    children: List.generate(state.list.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UsersDetails(
                                        id: state.list[index]['id'],
                                      )));
                            },
                            child: ListTile(
                              title: Text(state.list[index]['name']),
                              subtitle: Text(state.list[index]['email']),
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    }),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
