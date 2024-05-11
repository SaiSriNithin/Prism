import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({Key? key}) : super(key: key);

  // Define a list of event details
  final List<Map<String, String>> events = [
    {
      'eventText': 'CSE FAREWELL 2k24',
      'eventDepartment': 'CSE DEPT',
      'eventDate': '06-05-2024',
      'imagePath': 'assets/images/hostels-hero.jpg'
    },
    {
      'eventText': 'EEE Annual Day',
      'eventDepartment': 'EEE DEPT',
      'eventDate': '08-05-2024',
      'imagePath': 'assets/images/hostels-hero.jpg'
    },
    {
      'eventText': 'Mechanical Symposium',
      'eventDepartment': 'MECH DEPT',
      'eventDate': '10-05-2024',
      'imagePath': 'assets/images/hostels-hero.jpg'
    },
    {
      'eventText': 'Mechanical Symposium',
      'eventDepartment': 'MECH DEPT',
      'eventDate': '10-05-2024',
      'imagePath': 'assets/images/hostels-hero.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: Text('Campus Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.8,
              width: MediaQuery.of(context).size.width / 1.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              event['imagePath']!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Text(
                            '${event['eventText']}\n Organised by ${event['eventDepartment']}',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.black),
                                  SizedBox(width: 4),
                                  Text(
                                    event['eventDepartment']!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today,
                                      color: Colors.black),
                                  SizedBox(width: 4),
                                  Text(event['eventDate']!,
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Text(
                              'Join Event',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 17, 79, 90), // Button color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
