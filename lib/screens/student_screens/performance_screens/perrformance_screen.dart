import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:new_prism/providers/performance_provider.dart';
import 'package:new_prism/screens/student_screens/performance_screens/backlog_screen.dart';
import 'package:new_prism/screens/student_screens/performance_screens/performance_graph_screen.dart';
import 'package:new_prism/screens/student_screens/performance_screens/previous_results_screen.dart';
import 'package:new_prism/screens/student_screens/performance_screens/widgets/performance_card.dart';
import 'package:new_prism/screens/student_screens/performance_screens/widgets/performance_card_db.dart';
import 'package:new_prism/widgets/multi_purpose_card.dart';
import 'package:provider/provider.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double midPercentage = 0;
    List<double> midsR = [];
    List<double> semR = [];
    final List<Feature> features1 = [];
    final List<Feature> features2 = [];
    final userPerformance =
        Provider.of<PerformanceProvider>(context).performance;
    if (userPerformance.MidTotal.isNotEmpty) {
      midPercentage =
          userPerformance.MidScored.last / userPerformance.MidTotal.last;
      for (var i = 0; i < userPerformance.MidScored.length; i++) {
        midsR.add(userPerformance.MidScored[i] / userPerformance.MidTotal[i]);
      }
      for (var i = 0; i < userPerformance.MidScored.length; i++) {
        semR.add(userPerformance.PreviousSGPA[i] / 10);
      }
      features1
          .add(Feature(title: "Mid Marks", color: Colors.blue, data: midsR));
      features2.add(Feature(
          title: "Sem Marks",
          color: const Color.fromARGB(255, 110, 33, 243),
          data: semR));
    } else {
      midPercentage = 0;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Performance",
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
        elevation: 1.0,
        // shadowColor: Color.fromARGB(255, 59, 58, 58),
        // backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerformanceGraphScreen(
                                    fromData: features1,
                                    category: 'Mid',
                                    name: 'Mid Analysis',
                                    length: midsR.length,
                                  )));
                    },
                    child: PerformanceCardB(
                      percentage: midPercentage,
                      name: "Mid marks",
                      amount: userPerformance.MidScored.last,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerformanceGraphScreen(
                                    fromData: features2,
                                    category: 'Sem',
                                    name: 'Sem Analysis',
                                    length: semR.length,
                                  )));
                    },
                    child: PerformanceCard(
                      percentage: double.parse(userPerformance.CGPA) / 10,
                      name: "CGPA",
                      amount: double.parse(userPerformance.CGPA),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BacklogsScreen(
                                  backlogs: userPerformance.Backlogs)));
                    },
                    child: PerformanceCardB(
                      percentage: userPerformance.Backlogs.length /
                          userPerformance.TotalSub,
                      name: "Backlogs",
                      amount: userPerformance.Backlogs.length,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Text(
                "These are your updates ",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            MultiPurposeCard(
              category: "Previous Results",
              height1: MediaQuery.of(context).size.height / 7.9,
              screen: const PreviousResults(),
              subcategory: '',
              subcategory1: '',
            ),
          ],
        ),
      ),
    );
  }
}
