import 'package:flutter/material.dart';

class ButtonLoginToApply extends StatelessWidget {
  const ButtonLoginToApply({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        height: 60,
        child: const Center(
            child: Text("Log In To Apply",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, "/start");
      },
    );
  }
}
