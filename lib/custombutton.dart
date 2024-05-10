import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final String subtext;
  final Widget onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => onPressed,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: EdgeInsets.all(
          10.0,
        ),
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.3),

        // Increase padding for button size
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Color(0xFF114F5A),
            size: 35,
          ),
          SizedBox(height: 5.0),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          subtext == ''
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subtext,
                      style: TextStyle(
                        color: Color.fromARGB(255, 251, 171, 58),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
