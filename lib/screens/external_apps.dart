import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ExternalApps extends StatelessWidget {
  const ExternalApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('External Apps Integration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Share'),
              onPressed: () {
                Share.share('https://www.google.com', subject: 'Subject');
              },
            ),
            ElevatedButton(
              child: const Text('Calendar'),
              onPressed: () {
                final now = DateTime.now();
                Add2Calendar.addEvent2Cal(Event(
                  title: 'Title',
                  description: 'Description',
                  location: 'Location',
                  startDate: now,
                  endDate: now.add(Duration(days: 1)),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
