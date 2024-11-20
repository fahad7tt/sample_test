// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sample_test/screens/add_beneficiary.dart';
import 'package:sample_test/screens/login_screen.dart';
import 'package:sample_test/service/api_service.dart';
import 'package:sample_test/widgets/edit_beneficiary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
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
    try {
      final data = await ApiService.fetchBeneficiaries();
      setState(() {
        beneficiaries = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load beneficiaries: $e')),
      );
    }
  }

  // Function to show the confirmation dialog before deleting
  void _showDeleteConfirmationDialog(int beneficiaryId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content:
              const Text('Are you sure you want to delete this beneficiary?'),
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
                await _deleteBeneficiary(beneficiaryId);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete the beneficiary
  Future<void> _deleteBeneficiary(int id) async {
    try {
      await ApiService.deleteBeneficiary(id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Beneficiary deleted successfully')),
      );
      _loadBeneficiaries(); // Reload the list after deletion
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete beneficiary: $e')),
      );
    }
  }

  // Function to show the confirmation dialog before sign-out
  void _showSignOutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle sign out
  void _signOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beneficiaries',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 199, 172, 245),
        elevation: 8,
        actions: [
          ElevatedButton(
            onPressed: _showSignOutConfirmationDialog,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 233, 38, 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              minimumSize: const Size(
                  30, 20), // Set minimum width and height of the button
            ),
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
                      padding: const EdgeInsets.all(9),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(
                              'Name: ${beneficiary['name'] ?? 'Unknown'}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age: ${beneficiary['age'] ?? 'N/A'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                              Text('Place: ${beneficiary['place'] ?? 'N/A'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                              Text('Job: ${beneficiary['job'] ?? 'N/A'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  'Mobile: ${beneficiary['mobile_number'] ?? 'N/A'}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  // Navigate to the Edit screen
                                  final updatedBeneficiary =
                                      await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditBeneficiaryPage(
                                        beneficiary: beneficiary,
                                      ),
                                    ),
                                  );

                                  if (updatedBeneficiary != null) {
                                    // Refresh the beneficiary list after editing
                                    _loadBeneficiaries();
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Delete the beneficiary
                                  _showDeleteConfirmationDialog(
                                      beneficiary['id']);
                                },
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBeneficiaryPage()),
          );

          if (result != null && result) {
            // Refresh the beneficiary list after adding
            _loadBeneficiaries();
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}