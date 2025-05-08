import 'package:flutter/material.dart';

class AddRoleDialog extends StatefulWidget {
  final String? initialRole;
  final bool? initialLocationAccess;
  final bool? initialIssueAccess;

  const AddRoleDialog({
    super.key,
    this.initialRole,
    this.initialLocationAccess,
    this.initialIssueAccess,
  });

  @override
  State<AddRoleDialog> createState() => _AddRoleDialogState();
}

class _AddRoleDialogState extends State<AddRoleDialog> {
  late TextEditingController _roleController;
  bool locationAccess = false;
  bool issueAccess = false;

  @override
  void initState() {
    super.initState();
    _roleController = TextEditingController(text: widget.initialRole ?? '');
    locationAccess = widget.initialLocationAccess ?? false;
    issueAccess = widget.initialIssueAccess ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.initialRole == null ? 'Add Role' : 'Edit Role'),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Role'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(
                hintText: 'Enter role name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: locationAccess,
                        onChanged: (value) {
                          setState(() {
                            locationAccess = value!;
                          });
                        },
                      ),
                      const Text('All Location Access'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: issueAccess,
                        onChanged: (value) {
                          setState(() {
                            issueAccess = value!;
                          });
                        },
                      ),
                      const Text('All Issue Access'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    'role': _roleController.text,
                    'locationAccess': locationAccess ? 'Yes' : 'No',
                    'issueAccess': issueAccess ? 'Yes' : 'No',
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F80ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
