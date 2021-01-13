import 'package:animaltinder/bloc/authentication/authentication_bloc.dart';
import 'package:animaltinder/repositories/userRepository.dart';
import 'package:animaltinder/ui/pages/login.dart';
import 'package:animaltinder/ui/pages/profile.dart';
import 'package:animaltinder/ui/pages/signUp.dart';
import 'package:animaltinder/ui/pages/splash.dart';
import 'package:animaltinder/ui/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  final UserRepository _userRepository = UserRepository();
//  AuthenticationBloc _authenticationBloc;
//
//  @override
//  void initState() {
//    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
//
//    _authenticationBloc.add(AppStarted());
//
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocProvider(
//      create: (context) => _authenticationBloc,
//      child: MaterialApp(
//          debugShowCheckedModeBanner: false,
//          home: BlocBuilder(
//            bloc: _authenticationBloc,
//            builder: (BuildContext context, AuthenticationState state) {
//              if (state is Uninitialized) {
//                return Splash();
//              } else if (state is Authenticated) {
//                return Tabs();
//              } else if (state is AuthenticatedButNotSet) {
//                return Profile(
//                  userRepository: _userRepository,
//                  userId: state.userId,
//                );
//              } else if (state is Unauthenticated) {
//                return Login(
//                  userRepository: _userRepository,
//                );
//              } else
//                return Container();
//            },
//          )),
//    );
//  }
//}

class Home extends StatelessWidget {

  final UserRepository _userRepository;

  Home({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if (state is Uninitialized) {
            return Splash();
          } else if (state is Authenticated) {
            return Tabs();
          } else if (state is AuthenticatedButNotSet) {
            return Profile(
              userRepository: _userRepository,
              userId: state.userId,
            );
          } else if (state is Unauthenticated) {
            return Login(
              userRepository: _userRepository,
            );
          } else
            return Container();
        },
      ),
    );
  }
}
