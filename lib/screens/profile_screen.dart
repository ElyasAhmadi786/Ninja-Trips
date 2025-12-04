import 'package:flutter/material.dart';
import 'package:trips/screens/settings_screen.dart';
import 'package:trips/utils/language_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageManager.translate('myProfile')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Ninja Traveler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text('ninja@trips.com'),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStat('12', LanguageManager.translate('trips')),
                      _buildStat('24', LanguageManager.translate('reviews')),
                      _buildStat('8', LanguageManager.translate('countries')),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.favorite,
                    title: LanguageManager.translate('myFavorites'),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.history,
                    title: LanguageManager.translate('bookingHistory'),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings,
                    title: LanguageManager.translate('settings'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.help,
                    title: LanguageManager.translate('helpCenter'),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout,
                    title: LanguageManager.translate('logout'),
                    color: Colors.red,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        Color? color,
        required VoidCallback onTap,
      }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: color ?? Theme.of(context).primaryColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}