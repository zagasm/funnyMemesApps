import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import '../../widgets/showSnackBar.dart';
import '../../generated/assets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _handleReset() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      showCustomSnackbar(
        context: context,
        title: "Field Required",
        subtitle: "Please enter your email address.",
        type: SnackbarType.warning,
      );
      return;
    }

    showCustomSnackbar(
      context: context,
      title: "Reset Link Sent",
      subtitle: "Check your email to reset your password.",
      type: SnackbarType.success,
    );

    // Simulate delay or API call
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Go back to login
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
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
                        'Forgot Password',
                        style: GoogleFonts.orbitron(
                          fontSize: isMobile ? 24 : 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),

                      const SizedBox(height: 12),

                      Text(
                        "Enter your email address and we'll send you a reset link.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),

                      const SizedBox(height: 30),

                      _buildTextField(
                        controller: _emailController,
                        icon: Icons.email_outlined,
                        hint: 'Email',
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.5),

                      const SizedBox(height: 30),

                      GestureDetector(
                        onTap: _handleReset,
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
                              'Send Reset Link',
                              style: GoogleFonts.orbitron(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),

                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Remember your password? ",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Go back",
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
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
  }) {
    return TextField(
      controller: controller,
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
}
