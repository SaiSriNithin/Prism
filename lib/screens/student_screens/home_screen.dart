import 'package:flutter/material.dart';
import 'package:new_prism/widgets/curvedappbar.dart';
import 'package:new_prism/widgets/custombutton.dart';
import 'package:new_prism/screens/student_screens/test.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [Icons.schedule_rounded, Icons.home_sharp, Icons.chat];
    final texts = ["Today's Schedule", "Hostel", "Chats"];
    return Scaffold(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
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
                          Text(
                            'Nithin',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
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
                    return Container(
                      // width: MediaQuery.of(context).size.width / 2.2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5,
                            color: const Color.fromARGB(255, 215, 214, 214)),
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
                            Icon(icons[index],
                                color: const Color.fromARGB(255, 17, 79, 90),
                                size: 25.0),
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
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.all(3),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  children: const [
                    CustomButton(
                      buttonText: 'Attendance',
                      icon: Icons.person,
                      onPressed: Test(),
                      subtext: '59',
                    ),
                    CustomButton(
                      buttonText: 'Performance',
                      icon: Icons.speed,
                      onPressed: Test(),
                      subtext: '',
                    ),
                    CustomButton(
                      buttonText: 'Fee Status',
                      icon: Icons.attach_money,
                      onPressed: Test(),
                      subtext: 'Paid',
                    ),
                    CustomButton(
                      buttonText: 'Circulars',
                      icon: Icons.blur_circular_sharp,
                      onPressed: Test(),
                      subtext: 'NBA inspectioon',
                    ),
                    CustomButton(
                      buttonText: 'Transpoart',
                      icon: Icons.bus_alert_rounded,
                      onPressed: Test(),
                      subtext: '',
                    ),
                    CustomButton(
                      buttonText: 'library',
                      icon: Icons.library_books,
                      onPressed: Test(),
                      subtext: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// hell screen added