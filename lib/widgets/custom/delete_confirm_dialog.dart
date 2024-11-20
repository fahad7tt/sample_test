import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final int beneficiaryId;
  final VoidCallback onDelete;

  const DeleteConfirmationDialog({
    super.key,
    required this.beneficiaryId,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Deletion'),
      content: const Text('Are you sure you want to delete this beneficiary?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            onDelete();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
