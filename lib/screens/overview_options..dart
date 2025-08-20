import 'package:flutter/material.dart';

class OverviewOptions extends StatelessWidget {
  const OverviewOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Subscriptions & Options"),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOptionalItem("assets/icons/netflix.png", "Netflix", "200 ج.م"),
          _buildOptionalItem("assets/icons/spotify.png", "Spotify", "100 ج.م"),
          _buildOptionalItem("assets/icons/google.png", "Google", "150 ج.م"),
          _buildOptionalItem("assets/icons/facebook.png", "Facebook", "120 ج.م"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        onPressed: () {
          Navigator.pushNamed(context, '/add_expense');
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildOptionalItem(String icon, String name, String price) {
    return Card(
      color: Colors.grey[900],
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(icon, width: 32, height: 32),
        title: Text(name,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
        trailing: Text(price,
            style: const TextStyle(color: Colors.yellow, fontSize: 14)),
      ),
    );
  }
}
