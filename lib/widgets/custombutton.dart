import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final String subtext;
  final Widget onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    required this.subtext,
  });

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
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.height * 0.01,
        ),
        elevation: 1.5,
        shadowColor: Colors.grey.withOpacity(0.3),

        // Increase padding for button size
      ),
      // style: ElevatedButton.styleFrom(
      //     backgroundColor: Theme.of(context).colorScheme.background),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 35,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Text(
            buttonText,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          subtext == ''
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subtext,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
