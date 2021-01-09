import 'package:animaltinder/bloc/login/login_bloc.dart';
import 'package:animaltinder/repositories/userRepository.dart';
import 'package:animaltinder/ui/constants.dart';
import 'package:animaltinder/ui/widgets/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  final UserRepository _userRepository;

  Login({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(fontSize: 36.0),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        // Ustawia brak granicy miedzy gornym tekstem a body (takie usuniecie  hr w html)
        elevation: 0,
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          userRepository: _userRepository,
        ),
        child: LoginForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}
