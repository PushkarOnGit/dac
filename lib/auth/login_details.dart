import 'package:flutter/material.dart';

class LoginDetails {
  static CustomTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon:
          Icon(iconData, color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color.fromARGB(206, 129, 89, 238),
              )),
        ),
      ),
    );
  }

  static LoginButton(VoidCallback voidCallback, String text) {
    return SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
            onPressed: () {
              voidCallback();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))));
  }

  static Alertbox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}