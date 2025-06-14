import 'package:flutter/material.dart';
import 'package:fitpick/Pages/Login_home_page.dart';
import 'package:fitpick/constants/colors.dart';
import 'package:fitpick/service/auth_service.dart';
import 'package:fitpick/widgets/sign_button.dart';
import 'package:fitpick/widgets/signup.dart';
import 'package:fitpick/widgets/login.dart';
import 'package:fitpick/widgets/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;
  bool _obscurePassword = true;
  bool _emailError = false;
  bool _passwordError = false;

  void _signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      _emailError = !email.contains("@") || !email.contains(".com");
      _passwordError = password.length < 6;
    });

    if (_emailError || _passwordError) return;

    setState(() => isLoading = true);
    final result = await _authService.signup(email, password);
    setState(() => isLoading = false);

    if (result == null) {
      showSnackBar(context, "Sign up Successful!");
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginHomePage(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } else {
      showSnackBar(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,  // <-- Back button removed here
          title: ShaderMask(
            shaderCallback: (Rect bounds) {
              return AppColors.secondaryGradient.createShader(bounds);
            },
            child: const Text(
              "FitPick",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 0.5)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Welcome!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  errorText: _emailError ? 'Enter a valid email' : null,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  errorText: _passwordError ? 'Password must be at least 6 characters' : null,
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                                  ),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            isLoading
                                ? const CircularProgressIndicator(color: Colors.black)
                                : GestureDetector(
                                    onTap: _signUp,
                                    child: SignButton(),
                                  ),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Expanded(child: Divider(color: Colors.black, thickness: 1, indent: 20)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Or Continue With", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                                ),
                                Expanded(child: Divider(color: Colors.black, thickness: 1, endIndent: 20)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60, width: 60,
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(Icons.facebook, color: Colors.white, size: 30),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  height: 60, width: 60,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/images/Google_logo.png', fit: BoxFit.contain),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 60, width: 220,
                              decoration: BoxDecoration(gradient: AppColors.tertiaryGradient, borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Expanded(child: Padding(padding: const EdgeInsets.only(left: 15.0), child: Signup())),
                                  const SizedBox(width: 15),
                                  Expanded(child: Padding(padding: const EdgeInsets.only(right: 15.0), child: Login())),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () async {
                                const url = 'https://yourwebsite.com/privacy';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url));
                                }
                              },
                              child: const Text(
                                "Privacy Policy",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

