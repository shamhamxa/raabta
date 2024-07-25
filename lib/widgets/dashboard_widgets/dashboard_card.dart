import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            color: color,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
                // border: Border.all(width: 0, color: Colors.white)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    color: imagecolors,
                    height: 60,
                  )
                      .animate()
                      .slideX(delay: const Duration(milliseconds: 200))
                      .fade(),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: textColor),
                  )
                      .animate()
                      .slideX(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 200))
                      .fade(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
