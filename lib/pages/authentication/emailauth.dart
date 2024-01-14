// import 'package:flutter/material.dart';
// import 'login.dart';
// import 'signup.dart';
//
// class EmailAuth extends StatefulWidget{
//   const EmailAuth({Key? key,}): super(key: key);
//
//   @override
//   State<EmailAuth> createState() => _EmailAuthState();
// }
//
// class _EmailAuthState extends State<EmailAuth> {
//
//   bool isLoggedIn = true;
//
//   @override
//   Widget build(BuildContext context) =>
//       isLoggedIn
//           ? Login(onClickedSignUp: toggle)
//           : SignUp(onClickedSignIn: toggle);
//
//   void toggle() => setState( () => isLoggedIn = !isLoggedIn);
//
// }