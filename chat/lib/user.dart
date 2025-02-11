import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف الـ AppBar
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 207, 236, 250), // لون مطابق لـ main.dart
              Color.fromARGB(226, 13, 0, 70), // لون مطابق لـ main.dart
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Renad',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),

                // ✅ صندوق يحتوي على البريد الإلكتروني وكلمة المرور والسماح بمشاركة البيانات
                Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildInfoTile(
                            Icons.email, 'Renad90@gmail.com', context),
                        Divider(color: Colors.grey),
                        _buildInfoTile(Icons.lock, '', context),
                        Divider(color: Colors.grey),
                        SwitchListTile(
                          title: Text(
                            'السماح بمشاركة معلوماتي',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // ✅ صندوق يحتوي على زر "الدعم والمساعدة" و "تسجيل الخروج"
                Card(
                  color: Colors.red[50], // لون خفيف للأحمر مثل main.dart
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Icon(Icons.help_outline, color: Colors.black),
                          title: Text('الدعم والمساعدة'),
                          onTap: () {},
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.logout),
                          label: Text('تسجيل الخروج'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.red,
                            minimumSize: Size(double.infinity, 50),
                          ),
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

  Widget _buildInfoTile(IconData icon, String text, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(text),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text('تعديل', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
