import 'package:flutter/material.dart';
import 'package:new_prism/screens/splash_and_login_screens/login_screen.dart';
import 'package:new_prism/screens/splash_and_login_screens/onboarding_scrrens/onboarding_data_and_class.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;
  String whatPage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => LoginScreen(type: whatPage))),
                child: const Text("Login")),
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            isLastPage
                ? IconButton(
                    onPressed: () => pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn),
                    icon: Icon(Icons.arrow_back_ios_new_sharp,
                        color: Theme.of(context).colorScheme.onPrimary))
                : IconButton(
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn),
                    icon: Icon(Icons.arrow_forward_ios_sharp,
                        color: Theme.of(context).colorScheme.onPrimary))
          ],
        ),
      ),
      // isLastPage = controller.items.length - 1 == index

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                isLastPage = controller.items.length - 1 == index;
                whatPage = controller.items[index].title;
              });
            },
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "MREC ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "PRISM",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      controller.items[index].title,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.asset(controller.items[index].image),
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    Text(controller.items[index].descriptions,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 17),
                        textAlign: TextAlign.center),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
