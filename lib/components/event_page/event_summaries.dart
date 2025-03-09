import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/constants.dart';

class EventSummaries extends StatelessWidget {
  final String time;
  const EventSummaries({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 150,
          ),
          Container(
            height: 135,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: orangeSecondary),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 5.0,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Time of incident:",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(time,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left),
                  Text(
                    "What Happened:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(time,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
