import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> savedFeedback = [
    {
      'issue': 'Damaged Item',
      'submitted': '28 Apr, 2025',
      'feedback': 'The seat was torn near the edge.',
      'hasVoice': true,
    },
    {
      'issue': 'Late Delivery',
      'submitted': '26 Apr, 2025',
      'feedback': 'It arrived 2 days after the expected date.',
      'hasVoice': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Saved Feedback'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: savedFeedback.length,
        itemBuilder: (context, index) {
          final item = savedFeedback[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.report, color: Color(0xFFFCC737)),
                      SizedBox(width: 8),
                      Text(
                        'Issue: ${item['issue']}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Submitted: ${item['submitted']}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Feedback: ${item['feedback']}',
                    style: TextStyle(color: Colors.white),
                  ),
                  if (item['hasVoice']) ...[
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.mic, color: Color(0xFFFCC737)),
                        SizedBox(width: 8),
                        Text('Voice transcription available',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // View feedback details
                        },
                        child: Text('View',
                            style: TextStyle(color: Color(0xFFFCC737))),
                      ),
                      TextButton(
                        onPressed: () {
                          // Delete this entry
                        },
                        child: Text('Delete',
                            style: TextStyle(color: Colors.redAccent)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
