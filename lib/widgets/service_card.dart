import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String img, t;
  const ServiceCard(this.img, this.t, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 8.0, spreadRadius: 2.0)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 80,
          height: 80,
          child: Image.asset(img),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
