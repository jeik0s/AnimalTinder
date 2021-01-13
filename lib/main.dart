import 'package:animaltinder/bloc/authentication/authentication_bloc.dart';
import 'package:animaltinder/bloc/blocDelegate.dart';
import 'package:animaltinder/models/user.dart';
import 'package:animaltinder/repositories/userRepository.dart';
import 'package:animaltinder/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository  _userRepository = UserRepository();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
      BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: _userRepository) ..add(AppStarted()),
          child: Home(userRepository: _userRepository),
      )
  );
}