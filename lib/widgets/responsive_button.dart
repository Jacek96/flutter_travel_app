import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? widht;
  ResponsiveButton({super.key, this.widht, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF5d69b3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('images/button-one.png')],
      ),
    );
  }
}
