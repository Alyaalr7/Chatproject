import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagementPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // الحصول على المستخدم الحالي من Firebase
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'إدارة المستخدمين',
          style: TextStyle(color: const Color.fromARGB(226, 13, 0, 70)),
        ),
        centerTitle: true,
      ),
      body: user == null
          ? Center(child: Text('لا يوجد مستخدم مسجل حاليا.'))
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 207, 236, 250), // Light teal blue
                    Color.fromARGB(226, 13, 0, 70), // Strong blue
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue[200],
                      child: Text(
                        (user.displayName?.substring(0, 1) ?? 'U'),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'اسم المستخدم: ${user.displayName ?? "غير محدد"}',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      enabled: false, // غير قابل للتعديل
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'البريد الإلكتروني: ${user.email ?? "غير محدد"}',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      enabled: false, // غير قابل للتعديل
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // عملية تسجيل الخروج
                        _auth.signOut();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('تسجيل الخروج'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
