import 'package:flutter/material.dart';

class BeneficiaryListTile extends StatelessWidget {
  final dynamic beneficiary;
  final Function onEdit;
  final Function onDelete;

  const BeneficiaryListTile({
    super.key,
    required this.beneficiary,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 225, 223, 238),
      margin: const EdgeInsets.all(16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: Text('Name: ${beneficiary['name'] ?? 'Unknown'}',
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Age: ${beneficiary['age'] ?? 'N/A'}',
                style: const TextStyle(fontWeight: FontWeight.w500)),
            Text('Place: ${beneficiary['place'] ?? 'N/A'}',
                style: const TextStyle(fontWeight: FontWeight.w500)),
            Text('Job: ${beneficiary['job'] ?? 'N/A'}',
                style: const TextStyle(fontWeight: FontWeight.w500)),
            Text('Mobile: ${beneficiary['mobile_number'] ?? 'N/A'}',
                style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => onEdit(),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete(),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}