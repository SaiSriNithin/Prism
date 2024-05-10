import 'package:flutter/material.dart';
import 'package:new_prism/curvedappbar.dart';
import 'package:new_prism/custombutton.dart';
import 'package:new_prism/test.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [Icons.schedule_rounded, Icons.home_sharp, Icons.chat];
    final texts = ["Today's Schedule", "Hostel", "Chats"];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 248, 251),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.0),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 25, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Welcome 👋',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white)),
                          SizedBox(height: 5.0),
                          Text(
                            'Nithin',
                            style: TextStyle(color: Colors.white),
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
                    height: 76.0,
                    width: 76.0,
                    decoration: BoxDecoration(
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text('categories'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.18),
                            offset: Offset(0, 3),
                            blurRadius: 2.0,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icons[index],
                              color: Color.fromARGB(255, 17, 79, 90),
                              size: 30.0),
                          SizedBox(width: 10),
                          Text(texts[index],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              const Center(
                child: Text(
                  'Here are your latest updates',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                  children: [
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
                      buttonText: 'Books',
                      icon: Icons.book,
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