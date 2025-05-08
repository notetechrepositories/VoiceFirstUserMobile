import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FeedbackFormScreen extends StatefulWidget {
  @override
  _FeedbackFormScreenState createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  final _messageController = TextEditingController();
  String? _selectedIssue;
  File? image1, image2, video1, video2;

  List<String> issueTypes = [
    'Damaged Item',
    'Late Delivery',
    'Wrong Order',
    'Other',
  ];

  Future<void> _pickFile({required bool isImage, required int slot}) async {
    final result = await FilePicker.platform.pickFiles(
      type: isImage ? FileType.image : FileType.video,
    );

    if (result != null) {
      final file = File(result.files.single.path!);
      setState(() {
        if (isImage) {
          if (slot == 1) image1 = file;
          if (slot == 2) image2 = file;
        } else {
          if (slot == 1) video1 = file;
          if (slot == 2) video2 = file;
        }
      });
    }
  }

  Widget _filePickerBox(String label, File? file, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: file == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, color: Colors.grey),
                    Text(
                      "No file selected",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              : Text(
                  file.path.split('/').last,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Feedback Form'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown
            Text('Issue Type', style: TextStyle(color: Colors.white)),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[900],
              value: _selectedIssue,
              items: issueTypes.map((issue) {
                return DropdownMenuItem<String>(
                  value: issue,
                  child: Text(issue, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (val) {
                setState(() => _selectedIssue = val);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Feedback Text
            Text('Message', style: TextStyle(color: Colors.white)),
            TextField(
              controller: _messageController,
              maxLines: 5,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                hintText: 'Enter your feedback...',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Voice Section (placeholder)
            Row(
              children: [
                Icon(Icons.mic, color: Color(0xFFFCC737)),
                SizedBox(width: 10),
                Text(
                  'Voice Transcription Placeholder',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            Divider(height: 32, color: Colors.grey),

            // Image Uploads
            Text('Image Upload', style: TextStyle(color: Colors.white)),
            _filePickerBox(
              'Photo of damaged item',
              image1,
              () => _pickFile(isImage: true, slot: 1),
            ),
            _filePickerBox(
              'Evidence image',
              image2,
              () => _pickFile(isImage: true, slot: 2),
            ),

            SizedBox(height: 20),

            // Video Uploads
            Text('Video Upload', style: TextStyle(color: Colors.white)),
            _filePickerBox(
              'Delivery arrival video',
              video1,
              () => _pickFile(isImage: false, slot: 1),
            ),
            _filePickerBox(
              'Unboxing video',
              video2,
              () => _pickFile(isImage: false, slot: 2),
            ),

            SizedBox(height: 30),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFCC737),
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
