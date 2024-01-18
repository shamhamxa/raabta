import 'package:flutter/material.dart';

class LiscenseCard extends StatelessWidget {
  const LiscenseCard({
    super.key,
    required this.color,
    required this.image,
    required this.text,
  });
  final Color color;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 6,
        // color: Colors.blue.shade100,

        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                color: Colors.red,
                height: 60,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
