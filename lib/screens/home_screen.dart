import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/beneficiary_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final beneficiaryProvider = Provider.of<BeneficiaryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Beneficiaries')),
      body: FutureBuilder(
        future: beneficiaryProvider.fetchBeneficiaries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return ListView.builder(
            itemCount: beneficiaryProvider.beneficiaries.length,
            itemBuilder: (context, index) {
              final beneficiary = beneficiaryProvider.beneficiaries[index];
              return ListTile(
                title: Text(beneficiary['name']),
                subtitle: Text(beneficiary['details']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    beneficiaryProvider.deleteBeneficiary(beneficiary['id']);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
