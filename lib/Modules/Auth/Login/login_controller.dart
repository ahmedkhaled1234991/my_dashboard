import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Home/home_screen.dart';

class LoginController extends ControllerMVC {
  // singleton
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }
  static LoginController? _this;
  LoginController._();

  late TextEditingController usernameController, passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login(BuildContext context) async {
    // final result = await DataHandler.login(
    //   userName: usernameController.text,
    //   password: passwordController.text,
    // );
    // result.fold((l) {}, (r) {});
    GoRouter.of(context).goNamed(HomeScreen.routeName);
  }

  void init() {
    print("test calling init");
  }

  bool isSecure = true;
  void changePasswordVisibility() {
    isSecure = !isSecure;
    setState(() {});
  }
}
