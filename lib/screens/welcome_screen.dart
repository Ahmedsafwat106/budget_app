import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 800;
    return Scaffold(
      body: SafeArea(
        child: isWide ? _buildWide(context) : _buildMobile(context),
      ),
    );
  }

  // ---------------- Wide Layout ----------------
  Widget _buildWide(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: const Color(0xFFF6F7E9),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/welcome.png',
                      height: 280,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Calculate Smarter,\nSpend Wiser",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black87,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monthly Budget",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.accentGreen,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _thinInput(hint: "Insert Your Income"),
                    const SizedBox(height: 12),
                    _thinInput(hint: "Insert Your Name"),
                    const SizedBox(height: 12),
                    _thinInput(hint: "Insert Your Goals"),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                        ),
                        child: const Text("Start Your Calculation"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- Mobile Layout ----------------
  Widget _buildMobile(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
            Image.asset(
              'assets/images/welcome.png',
              height: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 18),
            Text(
              "Monthly Budget",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.accentGreen,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            _thinInput(hint: "Insert Your Income"),
            const SizedBox(height: 12),
            _thinInput(hint: "Insert Your Name"),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
                child: const Text("Start"),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Custom Input ----------------
  Widget _thinInput({required String hint}) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
