import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String pizzaName;
  final String pizzaPrice;
  final String pizzaDescription;
  final String pizzaurl;

  const Profile(
      {super.key,
      required this.pizzaName,
      required this.pizzaPrice,
      required this.pizzaDescription,
      required this.pizzaurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 201, 235),
        title: Text(pizzaName),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(pizzaurl),
              Text(
                pizzaName,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "$pizzaPrice DH",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                pizzaDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
