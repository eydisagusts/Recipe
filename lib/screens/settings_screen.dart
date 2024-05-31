import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeEnabled = false;
  bool areNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF00BCD4),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    isDarkModeEnabled = value;
                  });
                },
                activeColor: const Color(0xFF00BCD4),
                inactiveThumbColor: const Color(0xFF00BCD4),
                inactiveTrackColor: const Color(0xFFB2EBF2), // lighter shade for the track
              ),
            ),
            ListTile(
              title: const Text('Notifications'),
              trailing: Switch(
                value: areNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    areNotificationsEnabled = value;
                  });
                },
                activeColor: const Color(0xFF00BCD4),
                inactiveThumbColor: const Color(0xFF00BCD4),
                inactiveTrackColor: const Color(0xFFB2EBF2), // lighter shade for the track
              ),
            ),
            Divider(height: 30, color: Colors.grey[600]),
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Change Password'),
              onTap: () {
                // Implement the functionality to change password
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                // Implement the functionality to log out
              },
            ),
            ListTile(
              title: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                          'By deleting your account, you agree to pay a million dollars.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Show message that they don't have a million dollars
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'You don\'t have a million dollars. Now go read some recipes and think about what you just did!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close dialog
                                        Navigator.of(context).pop(); // Close settings screen
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Proceed'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Divider(height: 30, color: Colors.grey[600]),
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Language'),
              onTap: () {
                // Implement the functionality to change language
              },
            ),
            ListTile(
              title: const Text('Data Management'),
              onTap: () {
                // Implement the functionality for data management
              },
            ),
            ListTile(
              title: const Text(
                'Terms and Conditions',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Terms and Conditions'),
                      content: const Text(
                        'By using this app, you agree to our terms and conditions. Our only condition is that if you delete your account, you must pay a million dollars.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
