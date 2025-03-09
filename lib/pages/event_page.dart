import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/components/event_page/event_summaries.dart';
import 'package:hacktj_25_front_end/constants.dart';

class EventPage extends StatefulWidget {
  final String eventName;
  const EventPage({super.key, required this.eventName});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eventName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: blueSecondary,
      ),
      body: Column(
        children: [EventSummaries(time: "12:31 - 13:31")],
      ),
      backgroundColor: background,
    );
  }
}
