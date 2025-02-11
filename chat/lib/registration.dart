import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'policy.dart';
import 'homepage.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 243, 248),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 147, 175, 217),
                width: 1,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/monsef.png',
                fit: BoxFit.cover, // لتغطية الصورة بالكامل داخل الدائرة
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (Route<dynamic> route) => false,
                );
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
              Image.asset('images/a.png', width: 200, height: 188),
              const SizedBox(height: 10),
              const Text(
                "سجل في مُنصف",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 3, 33, 79)),
              ),
              const SizedBox(height: 20),
              buildTextField("الأسم الأول", Icons.person),
              const SizedBox(height: 10),
              buildTextField("الأسم الأخير", Icons.person),
              const SizedBox(height: 10),
              buildTextField("البريد الإلكتروني", Icons.email),
              const SizedBox(height: 10),
              buildTextField("كلمة المرور", Icons.lock, isPassword: true),
              const SizedBox(height: 10),
              buildTextField("تأكيد كلمة المرور", Icons.lock, isPassword: true),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min, // لضبط الحجم بناءً على المحتوى فقط
                  children: [
                    Transform.scale(
                      scale: 1.2, // تكبير المربع قليلاً
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 62, 200, 96),
                      ),
                    ),
                    const SizedBox(width: 8), // مسافة بين المربع والنص
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text:
                              "عن طريق إنشاء حسابك فإنك توافق على سياسة خصوصية مُنصف ",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "الشروط والأحكام",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 3, 33, 79),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PolicyPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ✅ زر تسجيل الدخول
              SizedBox(
                width: 280,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    if (!isChecked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "يجب الموافقة على الشروط والأحكام أولاً",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                        ),
                      );
                      return;
                    }
                    // تنفيذ تسجيل الدخول هنا
                  },
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
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return Container(
      width: 280,
      height: 49,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 236, 253),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl, // لجعل النص والأيقونة من اليمين
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 147, 175, 217),
            ),
            prefixIcon: Icon(icon, color: const Color.fromARGB(255, 3, 33, 79)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ),
    );
  }
}
