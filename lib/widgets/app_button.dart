import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.ontap,
    super.key,
    required this.isEnable,
  });
  final bool isEnable;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? ontap : null,
      child: Container(
        width: screenwidth(context) * 0.5,
        height: 50,
        decoration: BoxDecoration(
            color: isEnable
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
