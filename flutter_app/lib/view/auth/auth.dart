import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/core/components/passwordInput.dart';
import 'package:flutter_app/core/components/textInput.dart';
import 'package:flutter_app/services/validationService.dart';
import 'package:flutter_app/services/wrapper.dart';
import 'package:get/route_manager.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  bool _registeration = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rewritePasswordController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _rewritePasswordFocus = FocusNode();

  String _passwordError = "";
  String _emailError = "";
  String _againPassError = "";

  ValidationService validationService = ValidationService();
  @override
  Widget build(BuildContext context) {
    final animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    final animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FadeTransition(
          opacity: animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (_registeration) ? "Register" : "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: blue500),
                  )),
              const SizedBox(
                height: 16,
              ),
              TextInputSimple(
                hintText: "E-mail",
                focusNode: _emailFocus,
                controller: _emailController,
                errorText: _emailError,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordInput(
                hintText: "Password",
                focusNode: _passwordFocus,
                controller: _passwordController,
                errorText: _passwordError,
              ),
              const SizedBox(
                height: 16,
              ),
              (_registeration) ? _buildExtraPart() : const SizedBox(),
              ButtonMini.active(
                  text: (_registeration) ? "Register" : "Login",
                  onPressed: _validate),
              const SizedBox(
                height: 24,
              ),
              _buildSwitchText(animationController)
            ],
          ),
        ),
      ),
    );
  }

  register() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    (FirebaseAuth.instance.currentUser !=null)? Get.to(()=>Wrapper()) : Get.snackbar("Error", "Please try again");
  }
  
  login(){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    (FirebaseAuth.instance.currentUser !=null)? Get.to(()=>Wrapper()) : Get.snackbar("Error", "Please try again");
  }

  _buildExtraPart() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: PasswordInput(
        hintText: "Password Again",
        focusNode: _rewritePasswordFocus,
        controller: _rewritePasswordController,
        errorText: _againPassError,
      ),
    );
  }

  _buildSwitchText(AnimationController controller) {
    return InkWell(
      child: Text(
          (_registeration) ? "Already have an account?" : "Create an account"),
      onTap: () {
        controller.forward();
        setState(() {
          _registeration = !_registeration;
        });
      },
    );
  }

  void _validate() {
    if (_registeration) {
      if (validationService.passwordValidaton(_passwordController.text) &&
          validationService.emailValidation(_emailController.text) &&
          _passwordController.text == _rewritePasswordController.text) {
        register();
      } else {
        if (_passwordController.text != _rewritePasswordController.text) {
          setState(() {
            _againPassError = "Passwords are not same";
          });
        }
        setState(() {
          _passwordError =
              validationService.passwordError(_passwordController.text);
          _emailError = validationService.emailError(_emailController.text);
        });
      }
    } else {
      if (validationService.passwordValidaton(_passwordController.text) &&
          validationService.emailValidation(_emailController.text)) {
        login();
      } else {
        setState(() {
          _passwordError =
              validationService.passwordError(_passwordController.text);
          _emailError = validationService.emailError(_emailController.text);
        });
      }
    }
  }
}
