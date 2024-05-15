import 'package:flutter/material.dart';

class BacklogsScreen extends StatelessWidget {
  const BacklogsScreen({super.key, required this.backlogs});
  final List<dynamic> backlogs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Backlogs")),
      body: ListView.builder(
          itemCount: backlogs.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(backlogs[index]),
                    ),
                  ),
                ),
              )),
    );
  }
}
