import 'package:flutter/material.dart';
import 'package:new_prism/providers/student_provider.dart';
import 'package:new_prism/providers/who_is_logged_in_provider.dart';
import 'package:new_prism/screens/student_screens/attendance_screen/attendance_screen.dart';
import 'package:new_prism/screens/student_screens/community_screen.dart';
import 'package:new_prism/screens/student_screens/events_screen.dart';
import 'package:new_prism/screens/student_screens/performance_screens/perrformance_screen.dart';
import 'package:new_prism/screens/student_screens/time_table_screen.dart';
import 'package:new_prism/widgets/curvedappbar.dart';
import 'package:new_prism/widgets/custombutton.dart';
import 'package:new_prism/screens/student_screens/test.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      'assets/icons/todays_schedule.png',
      'assets/icons/hostels.png',
      'assets/icons/chat.png'
    ];
    final texts = ["Today's Schedule", "Hostel", "Chats"];
    final student = Provider.of<StudentProvider>(context, listen: false).user;
    final List<Widget> screens = [
      StudentTimeTableScreen(
          regulation: student.Regulation,
          department: student.Department,
          section: student.Section),
      const Test(),
      const Test()
    ];
    return Consumer<WhoIsLoggedIn>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.17),
          child: ClipPath(
            clipper: AppBarClipper(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/appbar.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 25, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome 👋',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background)),
                            const SizedBox(height: 5.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Text(
                                student.StudentName.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                              ),
                            ),
                            // Text(
                            //   whois.isSignedIn == 'parent'
                            //       ? successState.user.FatherName
                            //       : successState.user.StudentName,
                            //   style: const TextStyle(
                            //       fontSize: 20,
                            //       color: Color.fromARGB(255, 0, 0, 0)),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/MREC_logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'categories',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => screens[index]));
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.width / 2.2,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color:
                                    const Color.fromARGB(255, 215, 214, 214)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 196, 196, 196)
                                    .withOpacity(0.2),
                                offset: const Offset(0.5, 0.4),
                                blurRadius: 1.0,
                                spreadRadius: 1,
                              ),
                            ],
                          ),

                          child: IntrinsicWidth(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(icons[index],
                                //     color: const Color.fromARGB(255, 17, 79, 90),
                                //     size: 25.0),
                                Image.asset(
                                  icons[
                                      index], // Replace with the path to your SVG file
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(width: 10),
                                Text(texts[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'Here are your latest updates',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.all(3),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    children: [
                      const CustomButton(
                        buttonText: 'Attendance',
                        icon: Icons.person,
                        onPressed: AttendanceScreen(),
                        path: "assets/icons/attendance_icon.png",
                        subtext: '59',
                      ),
                      const CustomButton(
                        buttonText: 'Performance',
                        icon: Icons.speed,
                        onPressed: PerformanceScreen(),
                        path: "assets/icons/performance.png",
                        subtext: '',
                      ),
                      const CustomButton(
                        buttonText: 'Fee Status',
                        icon: Icons.attach_money,
                        onPressed: Test(),
                        path: "assets/icons/fee_status.png",
                        subtext: 'Paid',
                      ),
                      const CustomButton(
                        buttonText: 'Circulars',
                        icon: Icons.blur_circular_sharp,
                        onPressed: Test(),
                        path: "assets/icons/circular.png",
                        subtext: 'NBA inspectioon',
                      ),
                      const CustomButton(
                        buttonText: 'Transpoart',
                        icon: Icons.bus_alert_rounded,
                        onPressed: Test(),
                        path: "assets/icons/transport.png",
                        subtext: '',
                      ),
                      const CustomButton(
                        buttonText: 'Community',
                        icon: Icons.library_books,
                        onPressed: CommunityScreen(),
                        path: "assets/icons/community.png",
                        subtext: '',
                      ),
                      CustomButton(
                        buttonText: 'Events',
                        icon: Icons.library_books,
                        onPressed: EventsScreen(),
                        path: "assets/icons/community.png",
                        subtext: '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
