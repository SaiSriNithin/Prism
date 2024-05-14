import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

class PerformanceGraphScreen extends StatelessWidget {
  const PerformanceGraphScreen(
      {super.key,
      required this.fromData,
      required this.category,
      required this.name,
      required this.length});
  final List<Feature> fromData;
  final String category;
  final String name;
  final int length;

  @override
  Widget build(BuildContext context) {
    final growableList = List<String>.generate(
        length, (int index) => "$category ${index + 1}",
        growable: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analysis Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          LineGraph(
            features: fromData,
            size: const Size(320, 400),
            labelX: growableList,
            labelY: const ['20%', '40%', '60%', '80%', '100%'],
            showDescription: true,
            graphColor: Theme.of(context).colorScheme.onSurface,
            graphOpacity: 0.2,
            verticalFeatureDirection: true,
            descriptionHeight: 130,
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
