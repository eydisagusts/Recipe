import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        title: const Text('My Account', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF00BCD4),
        iconTheme: const IconThemeData(color: Colors.white), // Set back arrow color to white
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Account'),
                  content: const Text(
                      'By deleting your account, you agree to pay a million dollars. Are you sure you want to proceed?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the current dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                "You don't have a million dollars! Now go read some recipes and think about what you just did!"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the error dialog
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Proceed'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'IceHot1',
              style: TextStyle(fontSize: 18),
            ),
            Divider(height: 30, color: Colors.grey[600]),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'bjarniben@n1.is',
              style: TextStyle(fontSize: 18),
            ),
            Divider(height: 30, color: Colors.grey[600]),
            const Text(
              'Address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Bradenton 10 34201 1',
              style: TextStyle(fontSize: 18),
            ),
            Divider(height: 30, color: Colors.grey[600]),
            const Text(
              'Joined',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'August 31st 2015',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
