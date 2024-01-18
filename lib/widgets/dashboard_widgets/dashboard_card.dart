import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.color,
    required this.image,
    required this.text,
    required this.textColor,
    this.imagecolors,
    required this.onTap,
  });
  final Color color;
  final String image;
  final String text;
  final Color textColor;
  final Color? imagecolors;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 5,
            // color: Colors.blue.shade100,

            color: color,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    color: imagecolors,
                    height: 60,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
