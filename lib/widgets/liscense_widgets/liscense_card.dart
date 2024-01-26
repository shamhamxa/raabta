import 'package:flutter/material.dart';

class LiscenseCard extends StatelessWidget {
  const LiscenseCard({
    super.key,
    required this.color,
    required this.image,
    required this.text,
    required this.textColor,
    this.imageColor,
    this.onTap,
  });
  final Color color;
  final String image;
  final String text;
  final Color textColor;
  final Color? imageColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          elevation: 6,
          // color: Colors.blue.shade100,

          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  color: imageColor,
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
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
