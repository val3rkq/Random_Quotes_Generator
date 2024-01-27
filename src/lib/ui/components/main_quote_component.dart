import 'package:flutter/material.dart';
import 'package:src/ui/utils.dart';

class MainQuoteComponent extends StatelessWidget {
  const MainQuoteComponent({
    super.key,
    required this.title,
    required this.icon,
    required this.text,
    required this.textStyle,
  });

  final String title;
  final IconData icon;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 30),
            const SizedBox(
              width: 12,
            ),
            Text(title, style: AppTextStyle.bodyTextStyle),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          elevation: 0,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
