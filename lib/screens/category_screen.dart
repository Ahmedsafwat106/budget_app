import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/category_cubit/category_cubit.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["طعام", "مواصلات", "تسوق", "فواتير", "ترفيه"];

    return Scaffold(
      appBar: AppBar(title: const Text("الفئات")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.1),
                child: Icon(Icons.category,
                    color: Theme.of(context).colorScheme.primary),
              ),
              title: Text(categories[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                final filtered = <dynamic>[]; // safe fallback
                Navigator.pushNamed(context, '/category_expenses', arguments: {
                  'categoryName': categories[index],
                  'expenses': filtered,
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}