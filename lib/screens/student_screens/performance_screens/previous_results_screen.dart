import 'package:flutter/material.dart';
import 'package:new_prism/providers/performance_provider.dart';
import 'package:new_prism/screens/student_screens/performance_screens/sem_marks_screen.dart';
import 'package:new_prism/widgets/multi_purpose_card.dart';
import 'package:provider/provider.dart';

class PreviousResults extends StatelessWidget {
  const PreviousResults({super.key});
  @override
  Widget build(BuildContext context) {
    final userPerformance =
        Provider.of<PerformanceProvider>(context).performance;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 1,
        // shadowColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Previous Results",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Image.asset(
              'assets/MREC_logo.png',
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 8,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: userPerformance.PreviousSGPA.length,
        itemBuilder: (context, index) => MultiPurposeCard(
          category: "Semester ${index + 1}",
          height1: MediaQuery.of(context).size.height / 7.9,
          screen: SemMarksScreen(
            sem: "${index + 1}",
            rollNo: userPerformance.RollNo,
          ),
          subcategory: "SGPA : ${userPerformance.PreviousSGPA[index]}",
          subcategory1: '',
        ),
      ),
    );
  }
}
