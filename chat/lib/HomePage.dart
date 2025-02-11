import 'package:flutter/material.dart';
import 'login.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monsef chatbot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/monsef.png',
                  width: 207,
                  height: 188,
                ),
                const SizedBox(height: 20),
                const Text(
                  'مرحبا بك في مُنصف',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 27, 63),
                  ),
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'مساعدك القانوني أجيب على جميع استفساراتك القانونية في مجال قضايا الأحوال الشخصية',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()),
                );
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 3, 27, 63),
                size: 30,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'القانون يُهدف إلى تحقيق حكم مُنصف ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
