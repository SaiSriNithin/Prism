import 'package:flutter/material.dart';

class MultiPurposeCard extends StatelessWidget {
  const MultiPurposeCard(
      {super.key,
      required this.category,
      required this.subcategory,
      required this.subcategory1,
      required this.height1,
      required this.screen});
  final String category;
  final String subcategory;
  final String subcategory1;
  final double height1;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: height1,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(),
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => screen,
                ),
              );
            },
            child: Card(
              surfaceTintColor: Theme.of(context).colorScheme.surface,
              shadowColor: Colors.grey,
              elevation: 1.0,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: subcategory == "" && subcategory1 == ""
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        )
                      : subcategory1 == ""
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(category.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(subcategory.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary)),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  category.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            )),
            ),
          ),
        ));
  }
}
