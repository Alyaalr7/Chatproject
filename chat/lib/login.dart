import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';
import 'registration.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 243, 248),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // يعود إلى الشاشة السابقة
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 33, 79),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "عودة",
                style: TextStyle(color: Color.fromARGB(255, 147, 175, 217)),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 147, 175, 217),
                width: 1, // سمك الحدود
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/monsef.png',
                //fit: BoxFit.cover, // لتغطية الصورة بشكل كامل داخل الدائرة
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromARGB(255, 147, 175, 217),
              Color.fromARGB(255, 3, 33, 79),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/images/monsef.png', width: 200, height: 188),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Text(
                "تسجيل الدخول",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 3, 33, 79)),
              ),
              const SizedBox(height: 15),
              Container(
                width: 280,
                height: 49,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 236, 253),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  textAlign: TextAlign.right, // لضبط النص من اليمين لليسار
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "البريد الإلكتروني",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 147, 175, 217),
                    ),
                    suffixIcon: Icon(Icons.email,
                        color: Color.fromARGB(255, 3, 33, 79)), 
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 280,
                height: 49,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 236, 253),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  obscureText: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "كلمة المرور",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 147, 175, 217),
                    ),
                    suffixIcon:
                        Icon(Icons.lock, color: Color.fromARGB(255, 3, 33, 79)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 280,
                height: 39,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 33, 79),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                        color: Color.fromARGB(255, 147, 175, 217),
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      text: "ليس لديك حساب ؟ ",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "سجل الآن",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 3, 33, 79),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "خيارات أخرى لتسجيل الدخول",
                style: TextStyle(
                  color: Color.fromARGB(255, 147, 175, 217),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.xTwitter,
                        color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.google,
                        color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
