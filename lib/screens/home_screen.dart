import 'package:flutter/material.dart';
import 'package:sample_test/model/beneficiary_model.dart';
import 'package:sample_test/service/api_service.dart';
import 'package:sample_test/widgets/beneficiaries_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Beneficiaries')),
      body: FutureBuilder<List<Beneficiary>>(
        future: ApiService.fetchBeneficiaries(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('No beneficiaries found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return BeneficiaryListItem(beneficiary: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
