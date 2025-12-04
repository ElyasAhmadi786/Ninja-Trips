import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trips/providers/app_provider.dart';
import 'package:trips/utils/language_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  String _currency = 'USD';

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageManager.translate('settings')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Settings
          _buildSectionHeader(LanguageManager.translate('theme')),
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text(LanguageManager.translate('lightMode')),
                  value: ThemeMode.light,
                  groupValue: appProvider.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      appProvider.changeThemeMode(value);
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Text(LanguageManager.translate('darkMode')),
                  value: ThemeMode.dark,
                  groupValue: appProvider.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      appProvider.changeThemeMode(value);
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Text(LanguageManager.translate('systemTheme')),
                  value: ThemeMode.system,
                  groupValue: appProvider.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      appProvider.changeThemeMode(value);
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Language Settings
          _buildSectionHeader(LanguageManager.translate('language')),
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                RadioListTile<String>(
                  title: Text(LanguageManager.translate('english')),
                  value: 'en',
                  groupValue: appProvider.language,
                  onChanged: (value) {
                    if (value != null) {
                      appProvider.changeLanguage(value);
                    }
                  },
                ),
                RadioListTile<String>(
                  title: Text(LanguageManager.translate('persian')),
                  value: 'fa',
                  groupValue: appProvider.language,
                  onChanged: (value) {
                    if (value != null) {
                      appProvider.changeLanguage(value);
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Other Settings
          _buildSectionHeader(LanguageManager.translate('preferences')),
          SwitchListTile(
            title: Text(LanguageManager.translate('pushNotifications')),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
            },
          ),

          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: Text(LanguageManager.translate('currency')),
            subtitle: Text(_currency),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showCurrencyDialog();
            },
          ),

          const SizedBox(height: 20),

          // Support
          _buildSectionHeader(LanguageManager.translate('support')),
          _buildSettingItem(
            icon: Icons.help,
            title: LanguageManager.translate('helpCenter'),
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.description,
            title: LanguageManager.translate('termsConditions'),
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.privacy_tip,
            title: LanguageManager.translate('privacyPolicy'),
            onTap: () {},
          ),

          const SizedBox(height: 30),

          // App Info
          Center(
            child: Column(
              children: [
                Text(
                  LanguageManager.translate('appTitle'),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text('Version 2.0.0'),
                const SizedBox(height: 5),
                Text(
                  '© 2024 Ninja Trips. All rights reserved.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LanguageManager.translate('selectCurrency')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('USD - US Dollar'),
                trailing: _currency == 'USD' ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    _currency = 'USD';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('EUR - Euro'),
                trailing: _currency == 'EUR' ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    _currency = 'EUR';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('GBP - British Pound'),
                trailing: _currency == 'GBP' ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    _currency = 'GBP';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}