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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text(LanguageManager.translate('lightMode')),
                  secondary: const Icon(Icons.light_mode_outlined),
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
                  secondary: const Icon(Icons.dark_mode_outlined),
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
                  secondary: const Icon(Icons.brightness_auto_outlined),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                RadioListTile<String>(
                  title: Text(LanguageManager.translate('english')),
                  secondary: const Text('🇺🇸', style: TextStyle(fontSize: 22)),
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
                  secondary: const Text('🇮🇷', style: TextStyle(fontSize: 22)),
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
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_outlined),
                  title: Text(LanguageManager.translate('pushNotifications')),
                  value: appProvider.notifications,
                  onChanged: (value) {
                    appProvider.setNotifications(value);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on_outlined),
                  title: Text(LanguageManager.translate('currency')),
                  subtitle: Text(appProvider.currency),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {
                    _showCurrencyDialog(appProvider);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Support
          _buildSectionHeader(LanguageManager.translate('support')),
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                _buildSettingItem(
                  icon: Icons.help_outline,
                  title: LanguageManager.translate('helpCenter'),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56),
                _buildSettingItem(
                  icon: Icons.description_outlined,
                  title: LanguageManager.translate('termsConditions'),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56),
                _buildSettingItem(
                  icon: Icons.privacy_tip_outlined,
                  title: LanguageManager.translate('privacyPolicy'),
                  onTap: () {},
                ),
              ],
            ),
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
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
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
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }

  void _showCurrencyDialog(AppProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          title: Text(LanguageManager.translate('selectCurrency')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _currencyItem(provider, 'USD', 'USD - US Dollar'),
              _currencyItem(provider, 'EUR', 'EUR - Euro'),
              _currencyItem(provider, 'GBP', 'GBP - British Pound'),
              _currencyItem(provider, 'IRR', 'IRR - Iranian Rial'),
              _currencyItem(provider, 'AED', 'AED - UAE Dirham'),
            ],
          ),
        );
      },
    );
  }

  Widget _currencyItem(AppProvider provider, String code, String label) {
    return ListTile(
      title: Text(label),
      trailing: provider.currency == code
          ? Icon(Icons.check, color: Theme.of(context).primaryColor)
          : null,
      onTap: () {
        provider.setCurrency(code);
        Navigator.pop(context);
      },
    );
  }
}