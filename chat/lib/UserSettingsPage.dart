import 'package:flutter/material.dart';
import 'UserProfilePage.dart'; // استيراد صفحة third.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserSettingsPage(),
    );
  }
}

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
                ),
                SizedBox(height: 10),
                Text(
                  'Alyaa Alharthi',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                // زر الانتقال إلى صفحة إدارة المستخدمين
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserManagementPage()), // الربط بالصفحة
                    );
                  },
                  icon: Icon(Icons.manage_accounts),
                  label: Text('إدارة المستخدمين'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 20),

                // زر جديد للانتقال إلى صفحة الملف الشخصي
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserManagementPage()), // الربط بصفحة الملف الشخصي
                    );
                  },
                  icon: Icon(Icons.person),
                  label: Text('صفحة المستخدم'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),

                SizedBox(height: 20),
                SwitchListTile(
                  title: Text('اغلاق النظام'),
                  value: false,
                  onChanged: (value) {},
                ),
                SizedBox(height: 30),

                // مربع يحتوي على الأزرار
                Card(
                  color: Colors.red[50], // لون خفيف للأحمر
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.end, // محاذاة إلى اليمين
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'حذف جميع الدردشات',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            color: const Color.fromARGB(
                                255, 87, 84, 84)), // خط فاصل
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.end, // محاذاة إلى اليمين
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'حذف الحساب',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.end, // محاذاة إلى اليمين
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.logout),
                              label: Text('تسجيل خروج'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 244, 249, 252),
                                //   minimumSize: Size(150, 50),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
