import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_avila_tek/cubit/activeButton/active_button_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/jobs/jobs_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/photo/photo_cubit.dart';
import 'package:prueba_tecnica_avila_tek/cubit/user/user_cubit.dart';
import 'package:prueba_tecnica_avila_tek/presentation/pages/edit_user_info.dart';
import 'package:prueba_tecnica_avila_tek/presentation/pages/user_info.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) => UserCubit()..getUserData(context)),
        BlocProvider<JobsCubit>(create: (context) => JobsCubit()..getJobsData()),
        BlocProvider<PhotoCubit>(create: (context) => PhotoCubit()),
        BlocProvider<ActiveButtonCubit>(create: (context) => ActiveButtonCubit()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',
      routes: {'/': (_) => UserInfo(), '/edit': (_) => EditUserInfo()},
    );
  }
}
