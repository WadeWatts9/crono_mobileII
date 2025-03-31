import 'package:flutter/material.dart';

import '../models/lap.dart';

class LapItem extends StatelessWidget {
  final Lap lap;

  const LapItem({super.key, required this.lap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      color: Colors.teal[50],
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          'Volta ${lap.number}',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.teal[700],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tempo da volta: ${lap.lapTime}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[500],
              ),
            ),
            Text(
              'Tempo total: ${lap.totalTime}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[500],
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.timer,
          color: Colors.teal[700],
          size: 30,
        ),
      ),
    );
  }
}
