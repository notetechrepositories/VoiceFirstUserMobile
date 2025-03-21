import 'package:flutter/material.dart';
import 'package:voicefirstuser/Screens/login_page.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());

  void _handleOtpChange(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
    }
    setState(() {});
  }

  bool get isOtpComplete {
    return otpControllers.every((controller) => controller.text.isNotEmpty);
  }

  String get enteredOtp {
    return otpControllers.map((controller) => controller.text).join();
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Gradient Header with Curve
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.yellow.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Verify OTP",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Enter the OTP sent to your email",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 80),

            // OTP Input Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 40,
                    height: 50,
                    child: TextField(
                      controller: otpControllers[index],
                      focusNode: otpFocusNodes[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        counterText: "",
                      ),
                      onChanged: (value) => _handleOtpChange(value, index),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 30),

            // Verify OTP Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isOtpComplete
                      ? () {
                          print("OTP Verified: $enteredOtp");
                          // Navigate to the Login Page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor:
                        isOtpComplete ? Colors.orange : Colors.grey,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.orangeAccent,
                    elevation: 5,
                  ),
                  child: Text(
                    "Verify OTP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Resend OTP Option
            GestureDetector(
              onTap: () {
                print("Resend OTP Clicked");
              },
              child: RichText(
                text: TextSpan(
                  text: "Didn't receive the OTP? ",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Resend",
                      style: TextStyle(
                        color: Colors.orange.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // SizedBox(height: 30),

            // // Back to Forgot Password
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: RichText(
            //     text: TextSpan(
            //       text: "Go back to ",
            //       style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            //       children: [
            //         TextSpan(
            //           text: "Forgot Password",
            //           style: TextStyle(
            //             color: Colors.orange.shade800,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
