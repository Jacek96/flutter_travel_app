import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? widht;
  ResponsiveButton({super.key, this.widht = 120, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : widht,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF5d69b3),
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Image.asset('images/button-one.png'),
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: AppText(
                      text: 'Zamów wycieczkę',
                      color: Colors.white,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
