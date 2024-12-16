import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/service_api.dart';
import 'package:flutter_application_1/models/currentprice.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/login.dart'; // Import LoginPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ServiceApi serviceApi = ServiceApi();
  late Currentprice _currentprice;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    Currentprice currentprice = await serviceApi.getCurrentPrice();
    setState(() {
      _currentprice = currentprice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home Page"),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentprice != null) // ตรวจสอบว่าข้อมูลมีอยู่ก่อนแสดงผล
              Text(
                _currentprice.disclaimer, // แสดงข้อความ disclaimer
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, // จัดข้อความให้อยู่ตรงกลาง
              )
            else
              const CircularProgressIndicator(), // แสดง Loading หากข้อมูลยังโหลดไม่เสร็จ
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: const Text("Go to Profile Page"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text("Go to Login Page"),
            ),
          ],
        ),
      ),
    );
  }
}
