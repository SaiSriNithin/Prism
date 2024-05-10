class OnboardingInfo {
  final String title;
  final String descriptions;
  final String image;

  OnboardingInfo(
      {required this.title, required this.descriptions, required this.image});
}

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Student",
        descriptions:
            "Stay ahead in college life! Catch daily updates on campus events, study hacks, and student news. Stay connected, stay informed - don't miss out on the latest buzz!",
        image: "assets/students_onboarding.png"),
    OnboardingInfo(
        title: "Parent",
        descriptions:
            "Parents, stay in the loop with your child's academic journey! Get instant access to their info and receive important notifications. Stay connected, stay informed - we've got you covered!",
        image: "assets/parents_onboarding.png"),
    OnboardingInfo(
        title: "Faculty",
        descriptions:
            "Faculty members, keep your finger on the pulse of campus life! Access student information and receive timely notifications. Stay connected, stay informed - empowering academic excellence!",
        image: "assets/faculty_onboarding.png"),
  ];
}
