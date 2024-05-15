import 'package:flutter/material.dart';
import 'package:new_prism/screens/student_screens/attendance_screen/widgets/linear_proress_bar.dart';

class PerformanceCardB extends StatelessWidget {
  const PerformanceCardB({
    super.key,
    required this.name,
    required this.percentage,
    required this.amount,
  });
  final String name;
  final double percentage;
  final int amount;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(),
      height: height / 6.35,
      width: width / 2.2,
      child: Card(
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        color: Colors.white,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    amount.toString(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              Stack(
                children: [
                  LinearProgressBar(
                    progressPer: percentage,
                    barcolor: Theme.of(context).colorScheme.primary,
                  ),
                  const Center(
                      child: Text(
                    "",
                    style: TextStyle(fontSize: 22),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
