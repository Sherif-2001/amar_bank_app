import 'package:flutter/material.dart';

class ApplyButton extends StatefulWidget {
  const ApplyButton({super.key});

  @override
  State<ApplyButton> createState() => _ApplyButtonState();
}

class _ApplyButtonState extends State<ApplyButton> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 2.0)
          ],
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      height: screenheight / 20,
      width: 70,
      child: const Center(
        child: Text(
          'Apply',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
