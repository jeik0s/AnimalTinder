import 'package:animaltinder/bloc/authentication/authentication_bloc.dart';
import 'package:animaltinder/bloc/signup/sign_up_bloc.dart';
import 'package:animaltinder/repositories/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  final UserRepository _userRepository;

  SignUpForm({@required UserRepository userRepository}): assert(userRepository != null), _userRepository = userRepository;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpBloc _signUpBloc;
  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isSignUpButtonEnabled(SignUpState state){
    return isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    _signUpBloc = SignUpBloc(userRepository: _userRepository);

    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);


    super.initState();
  }


  void _onFormSubmitted(){
    _signUpBloc.add(SignUpWithCredentialsPressed(email: _emailController.text, password: _passwordController.text));
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return BlocListener(
      bloc: _signUpBloc,
      listener: (BuildContext context, SignUpState state){
        if(state.isFailure){
          Scaffold.of(context)
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Sign Up Failed"),
                        Icon(Icons.error)
                      ],
                  ),
                )
              );
        }
        if(state.isSubmitting){
          print("isSubmitting");
          Scaffold.of(context)
            ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Signing up..."),
                      CircularProgressIndicator(),
                    ],
                  ),
                )
            );
        }
        if(state.isSuccess) {
          print("Success");
          BlocProvider.of<AuthenticationBloc>.add(LoggedIn());
          Navigator.of(context).pop();
        }
      }
    );
  }

  void _onEmailChanged() {
    _signUpBloc.add(EmailChanged(email: _emailController.text),);
  }

  void _onPasswordChanged() {
    _signUpBloc.add(PasswordChanged(password: _passwordController.text),);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

}
