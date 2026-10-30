import 'dart:async';

import 'package:flutter/material.dart';

import '../app/routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _goToLogin);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goToLogin() {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _goToLogin,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primaryDark],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -80,
                right: -60,
                child: _blob(220, Colors.white.withValues(alpha: 0.08)),
              ),
              Positioned(
                bottom: -100,
                left: -80,
                child: _blob(260, Colors.white.withValues(alpha: 0.10)),
              ),
              Positioned(
                bottom: -140,
                right: -40,
                child: _blob(200, Colors.white.withValues(alpha: 0.06)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppLogo(
                        size: 96,
                        background: Colors.white,
                        iconColor: AppColors.primary,
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Xnotes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Simpan setiap ide, rencana, dan momen berharga dalam satu tempat.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
