import 'package:flutter/material.dart';
class ButtonCustomized extends StatelessWidget {
  final String text;
  //final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const ButtonCustomized({
    Key? key,
    required this.text,
    //required this.imagePath,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * .55,
          height: MediaQuery.of(context).size.height * .08,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   imagePath,
              //   width: 24,
              //   height:24,
              // ),
              // SizedBox(width: 20,),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
