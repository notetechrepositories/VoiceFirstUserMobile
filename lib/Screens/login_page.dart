import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voicefirstuser/Screens/forgot_password.dart';
import 'package:voicefirstuser/Screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false; // To show loading indicator
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final String username = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    var body = jsonEncode(<String, String>{
      'username': username,
      'password': password,
    });

    HttpOverrides.global = MyHttpOverrides();
    try {
      final response = await https.post(
        Uri.parse('https://10.0.2.2:7027/api/auth/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['data'] != null) {
          final token = responseData['data']['token'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          setState(() => _errorMessage = 'Invalid username or password.');
        }
      } else {
        setState(() => _errorMessage = 'An error occurred. Please try again.');
      }
    } catch (e) {
      setState(() => _errorMessage = "Error: ${e.toString()}");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Orange Wave
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.yellow.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Welcome Back",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 5),
                    Text("Please sign in to continue",
                        style: TextStyle(fontSize: 16, color: Colors.white70)),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            // Email Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email or Mobile number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.orange),
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Password Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.orange.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            // Error Message
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),

            SizedBox(height: 20),

            // Login Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.orangeAccent,
                    elevation: 5,
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Login",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// HTTP Overrides for localhost SSL issues
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
