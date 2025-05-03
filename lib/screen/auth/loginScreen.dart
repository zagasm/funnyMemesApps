import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zagasm/screen/auth/signUpScreen.dart';
import '../../generated/assets.dart';
import '../../widgets/showSnackBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String demoEmail = 'demo@example.com';
  final String demoPassword = '123456';

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showCustomSnackbar(
        context: context,
        title: "Missing Fields",
        subtitle: "Please enter both email and password.",
        type: SnackbarType.warning,
      );
      return;
    }

    if (email == demoEmail && password == demoPassword) {
      showCustomSnackbar(
        context: context,
        title: "Login Successful",
        subtitle: "Welcome back!",
        type: SnackbarType.success,
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignUpScreen()),
        );
      });
    } else {
      showCustomSnackbar(
        context: context,
        title: "Login Failed",
        subtitle: "Invalid email or password.",
        type: SnackbarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Stack(
            children: [
              // Gradient background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      //Color.fromARGB(180, 103, 58, 183),
                      Colors.white,Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GlassContainer(
                    blur: 20,
                    shadowStrength: 8,
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.deepPurple.withOpacity(0.3),
                      width: 1.5,
                    ),
                    width: isMobile ? size.width * 0.95 : size.width * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Logo
                          Image.asset(
                           Assets.logoNameLogo,
                            width: isMobile ? size.width * 0.35 : size.width * 0.2,
                          )
                              .animate()
                              .fadeIn(duration: 1.seconds)
                              .scale(duration: 800.ms)
                              .shimmer(duration: 2.seconds),

                          const SizedBox(height: 20),

                          Text(
                            'Welcome Back',
                            style: GoogleFonts.orbitron(
                              fontSize: isMobile ? 26 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),

                          const SizedBox(height: 30),

                          _buildTextField(
                            controller: _emailController,
                            icon: Icons.email_outlined,
                            hint: 'Email',
                          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.5),

                          const SizedBox(height: 20),

                          _buildTextField(
                            controller: _passwordController,
                            icon: Icons.lock_outline,
                            hint: 'Password',
                            obscure: true,
                          ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.5),

                          const SizedBox(height: 30),

                          GestureDetector(
                            onTap: _handleLogin,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  colors: [Colors.deepPurple, Colors.purpleAccent],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepPurple.withOpacity(0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.orbitron(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),

                          const SizedBox(height: 24),

                          // Modern side-by-side social buttons
                          Row(
                            children: [
                              Expanded(
                                child: _buildSocialButton(
                                  icon: 'assets/logo/google.png',
                                  text: 'Google',
                                  onPressed: () {
                                    showCustomSnackbar(
                                      context: context,
                                      title: "Coming Soon",
                                      subtitle: "Google login integration in progress.",
                                      type: SnackbarType.warning,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildSocialButton(
                                  icon: 'assets/logo/apple.png',
                                  text: 'Apple',
                                  dark: true,
                                  onPressed: () {
                                    showCustomSnackbar(
                                      context: context,
                                      title: "Coming Soon",
                                      subtitle: "Apple login integration in progress.",
                                      type: SnackbarType.warning,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.4),

                          const SizedBox(height: 20),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUpScreen()),
                              );
                            },
                            child:
                            RichText(
                              text: TextSpan(
                                text: "Don’t have an account? ",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign up",
                                    style: GoogleFonts.roboto(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ).animate().fadeIn(duration: 600.ms),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(duration: 1.seconds).scale(begin: const Offset(0.9, 0.9)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.deepPurple.withOpacity(0.3)),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required String text,
    required VoidCallback onPressed,
    bool dark = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.deepPurple.withOpacity(0.2), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 22, height: 22),
            const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.roboto(
                color: dark ? Colors.white : Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
