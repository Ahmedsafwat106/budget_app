import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = {
      "name": "Ahmed Safwat",
      "email": "ahmed@gmail.com",
    };

    return Scaffold(
      appBar: AppBar(title: const Text("الملف الشخصي")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Theme.of(context).colorScheme.primary,
              backgroundImage: const AssetImage("assets/images/avatar.png"),
            ),
            const SizedBox(height: 15),
            Text(
              userData["name"]!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              userData["email"]!,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.blue),
                    title: const Text("الإعدادات"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {},
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("تسجيل الخروج",
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/welcome");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}