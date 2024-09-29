import 'package:dac/auth/login_details.dart';
import 'package:dac/pages/home_page.dart';
import 'package:dac/pages/registration_page.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login(String email, String password) async {
    if (email == "" && password == "") {
      LoginDetails.Alertbox(context, 'Enter Required fields');
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HomePage()));
          print(usercredential);
        });
      } on FirebaseAuthException catch (ex) {
        return LoginDetails.Alertbox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Image.network(
                  'https://cdni.iconscout.com/illustration/premium/thumb/forgot-password-6869766-5628002.png',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Text('Login Here!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginDetails.CustomTextField(
                        emailController, "Email", Icons.mail, false),
                    LoginDetails.CustomTextField(
                        passwordController, "Passoword", Icons.password, true),
                    const SizedBox(height: 10),
                    LoginDetails.LoginButton(
                          () {
                        login(emailController.text.toString(),
                            passwordController.text.toString());
                      },
                      "Login",
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't registered yet ?",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Registration())));
                            },
                            child: const Text('Register here',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}