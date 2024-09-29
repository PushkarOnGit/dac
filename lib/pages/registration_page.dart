import "package:dac/pages/home_page.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../auth/login_details.dart";

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  register(String email, String password) async {
    if (email == "" && password == "") {
      LoginDetails.Alertbox(context, 'Enter Required fields');
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
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
        appBar: AppBar(
          title: const Text("Register Here!",),
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Image.network(
                'https://cdni.iconscout.com/illustration/premium/thumb/forgot-password-6869766-5628002.png',
                height:
                250, // Aap apni pasand ke anusaar height aur width set kar sakte hain
                width: double
                    .infinity, // Yeh image ka width screen ke width ke barabar hogi
                fit: BoxFit
                    .cover, // Yeh image ko container ke saath fit karne ke liye hai
              ),

              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginDetails.CustomTextField(
                      emailController, 'Email', Icons.email, false),
                  LoginDetails.CustomTextField(
                      passwordController, 'Password', Icons.password, false),
                  const SizedBox(height: 30),
                  LoginDetails.LoginButton(() {
                    register(emailController.text.toString(),
                        passwordController.text.toString());
                  }, 'Register')
                ],
              ),
            ],
          ),
        ));
  }
}