import 'package:flutter/material.dart';
import 'package:sample_test/screens/add_beneficiary.dart';
import 'package:sample_test/screens/edit_beneficiary.dart';
import 'package:sample_test/screens/login_screen.dart';
import 'package:sample_test/service/beneficiary_controller.dart';
import 'package:sample_test/widgets/beneficiaries/beneficiary_list_tile.dart';
import 'package:sample_test/widgets/custom/delete_confirm_dialog.dart';
import 'package:sample_test/widgets/custom/floating_action_button.dart';
import 'package:sample_test/widgets/custom/sign_out_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> beneficiaries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBeneficiaries();
  }

  Future<void> _loadBeneficiaries() async {
    setState(() => isLoading = true);
    beneficiaries = await BeneficiaryController.loadBeneficiaries(context);
    setState(() => isLoading = false);
  }

  // Show Sign Out Confirmation
  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SignOutDialog(onSignOut: _signOut);
      },
    );
  }

  // Handle Sign Out
  void _signOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  // Show Deletion Confirmation Dialog
  void _showDeleteConfirmationDialog(int beneficiaryId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteConfirmationDialog(
          beneficiaryId: beneficiaryId,
          onDelete: () async {
            await BeneficiaryController.deleteBeneficiary(
                beneficiaryId, context);
            _loadBeneficiaries();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beneficiaries',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromARGB(255, 199, 172, 245),
        elevation: 8,
        actions: [
          ElevatedButton(
            onPressed: _showSignOutDialog,
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 233, 38, 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                minimumSize: const Size(70, 32)),
            child: const Text('Logout'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : beneficiaries.isEmpty
              ? const Center(child: Text('No beneficiaries found.'))
              : ListView.builder(
                  itemCount: beneficiaries.length,
                  itemBuilder: (context, index) {
                    final beneficiary = beneficiaries[index];
                    return Padding(
                      padding: const EdgeInsets.all(13),
                      child: BeneficiaryListTile(
                        beneficiary: beneficiary,
                        onEdit: () async {
                          final updatedBeneficiary = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditBeneficiaryPage(
                                beneficiary: beneficiary,
                              ),
                            ),
                          );

                          if (updatedBeneficiary != null) {
                            _loadBeneficiaries();
                          }
                        },
                        onDelete: () {
                          _showDeleteConfirmationDialog(beneficiary['id']);
                        },
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBeneficiaryPage()),
          );

          if (result != null && result) {
            _loadBeneficiaries();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
