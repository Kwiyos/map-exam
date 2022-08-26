import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_exam/home/bloc/home_bloc.dart';
import 'package:map_exam/home/home_repository.dart';

import 'login/bloc/login_bloc.dart';
import 'login/login_repository.dart';
import 'login/login_screen.dart';
import 'firebase/firebase_options.dart';
import 'home/home_screen.dart';
import 'home/edit_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'map_exam',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myFirst',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (context) => BlocProvider(create: (_) => LoginBloc(LoginRepository()), child: const LoginScreen()),
        '/home': (context) => BlocProvider(create: (_) => HomeBloc(HomeRepository()), child: const HomeScreen()),
      },
      initialRoute: '/login',
      //home: const HomeScreen(),
      // home: const EditScreen(),
    );
  }
}
