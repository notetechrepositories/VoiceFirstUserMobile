import 'package:flutter/material.dart';
import 'package:voicefirstuser/User/Issue_Forms/issueForm.dart';

class SavedScreen extends StatefulWidget {
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  void _deleteEntry(int index) {
    setState(() {
      feedbackList.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Entry deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Saved Feedback'),
        backgroundColor: Colors.black,
      ),
      body: feedbackList.isEmpty
          ? Center(
              child: Text(
                'No feedback submitted yet.',
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
                final item = feedbackList[index];

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
                        // Issue Type
                        Row(
                          children: [
                            Icon(Icons.report, color: Color(0xFFFCC737)),
                            SizedBox(width: 8),
                            Text(
                              'Issue: ${item.issueType}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),

                        // Message
                        Text(
                          'Feedback: ${item.message}',
                          style: TextStyle(color: Colors.white),
                        ),

                        // Voice info
                        if (item.transcription.trim().isNotEmpty) ...[
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.mic, color: Color(0xFFFCC737)),
                              SizedBox(width: 8),
                              Text(
                                'Voice transcription included',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],

                        // Buttons
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // TODO: Show details screen
                              },
                              child: Text(
                                'View',
                                style: TextStyle(color: Color(0xFFFCC737)),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _deleteEntry(index),
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.redAccent),
                              ),
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
