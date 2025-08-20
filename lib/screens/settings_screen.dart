import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool biometricLogin = false;
  String currency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الإعدادات")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SwitchListTile(
              title: const Text("الإشعارات"),
              value: notifications,
              secondary: const Icon(Icons.notifications),
              onChanged: (v) => setState(() => notifications = v),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SwitchListTile(
              title: const Text("تسجيل الدخول البيومتري"),
              value: biometricLogin,
              secondary: const Icon(Icons.fingerprint),
              onChanged: (v) => setState(() => biometricLogin = v),
            ),
          ),
          const SizedBox(height: 20),
          const Text("العملة الافتراضية",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            value: currency,
            items: const [
              DropdownMenuItem(value: 'USD', child: Text('USD')),
              DropdownMenuItem(value: 'EUR', child: Text('EUR')),
              DropdownMenuItem(value: 'EGP', child: Text('EGP')),
              DropdownMenuItem(value: 'SAR', child: Text('SAR')),
            ],
            onChanged: (v) => setState(() => currency = v ?? 'USD'),
          ),
        ],
      ),
    );
  }
}