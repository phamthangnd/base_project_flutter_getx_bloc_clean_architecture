import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/presentation/ui/pages/0_bloc_example/example_bloc/example_bloc.dart';
// import 'package:base_proj/bloc/home_screen/home_screen_bloc.dart';
// import 'package:base_proj/bloc/login_screen/login_screen_bloc.dart';
// import 'package:base_proj/bloc/splash_screen/splash_screen_bloc.dart';

import 'injection_container.dart';

MultiBlocProvider multiBlocProvider({required Widget child}) {
  return MultiBlocProvider(child: child, providers: [
    // BlocProvider<SplashScreenBloc>(
    //   create: (context) => sl<SplashScreenBloc>(),
    // ),
    // BlocProvider<LoginScreenBloc>(
    //   create: (context) => sl<LoginScreenBloc>(),
    // ),
    // BlocProvider<HomeScreenBloc>(
    //   create: (context) => sl<HomeScreenBloc>(),
    // ),
    BlocProvider<ExampleBloc>(
      create: (context) => sl<ExampleBloc>(),
    ),

  ]);
}
