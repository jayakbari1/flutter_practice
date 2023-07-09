import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_repo.dart';
import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple Image Repository
    return BlocProvider(
      create: (context) => BlocRepo()..add(InitialEvent()),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );

    /* return BlocProvider(
      create: (context) => SampleDataBloc()..add(SampleDataInitialEvent()),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SampleDataScreen(),
      ),
    );*/

    // User Data Repository
    /*   return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        title: 'Repository Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserApiScreen(),
      ),
    );*/
  }
}
