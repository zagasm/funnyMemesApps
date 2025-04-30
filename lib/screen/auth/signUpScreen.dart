import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../../widgets/showSnackBar.dart';
import '../home/homeScreen.dart'; // Make sure this exists

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  void _handleSignUp() {
    if (!_formKey.currentState!.validate()) {
      showCustomSnackbar(
        context: context,
        title: "Form Error",
        subtitle: "Please fix the errors in red",
        type: SnackbarType.warning,
      );
      return;
    }

    if (_password.text != _confirmPassword.text) {
      showCustomSnackbar(
        context: context,
        title: "Password Mismatch",
        subtitle: "Passwords do not match",
        type: SnackbarType.error,
      );
      return;
    }

    showCustomSnackbar(
      context: context,
      title: "Success",
      subtitle: "Account created successfully",
      type: SnackbarType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ✅ Soft gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(180, 103, 58, 183), // Soft DeepPurple
                  Colors.white,
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
                shadowStrength: 6,
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.deepPurple.withOpacity(0.3), width: 1.5),
                width: isMobile ? size.width * 0.95 : size.width * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/nameLogo.png',
                          width: isMobile ? size.width * 0.35 : size.width * 0.2,
                        )
                            .animate()
                            .fadeIn(duration: 1.seconds)
                            .scale(duration: 800.ms)
                            .shimmer(duration: 2.seconds),

                        const SizedBox(height: 20),

                        Text(
                          'Create Account',
                          style: GoogleFonts.orbitron(
                            fontSize: isMobile ? 24 : 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ).animate().fadeIn().slideY(begin: -0.2),

                        const SizedBox(height: 20),

                        _buildTextField(
                          controller: _fullName,
                          icon: Icons.person_outline,
                          hint: 'Full Name',
                          validator: (val) => val == null || val.isEmpty ? 'Enter your name' : null,
                        ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.5),

                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _email,
                          icon: Icons.email_outlined,
                          hint: 'Email',
                          validator: (val) {
                            if (val == null || val.isEmpty) return 'Enter your email';
                            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(val)) {
                              return 'Enter valid email';
                            }
                            return null;
                          },
                        ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.5),

                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _password,
                          icon: Icons.lock_outline,
                          hint: 'Password',
                          obscure: true,
                          validator: (val) => val == null || val.length < 6 ? 'Min 6 characters' : null,
                        ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.5),

                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _confirmPassword,
                          icon: Icons.lock,
                          hint: 'Confirm Password',
                          obscure: true,
                          validator: (val) => val == null || val.isEmpty ? 'Confirm your password' : null,
                        ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.5),

                        const SizedBox(height: 25),

                        GestureDetector(
                          onTap: _handleSignUp,
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
                                'Sign Up',
                                style: GoogleFonts.orbitron(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),

                        const SizedBox(height: 15),

                        TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>AdvancedHomeScreen()));
                          },
                          child:  RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: GoogleFonts.roboto(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animate().fadeIn(),
                      ],
                    ),
                  ),
                ),
              ).animate().fadeIn(duration: 1.seconds).scale(begin: const Offset(0.9, 0.9)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.85),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.deepPurple.withOpacity(0.3)),
        ),
      ),
    );
  }
}
