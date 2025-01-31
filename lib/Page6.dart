// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url =
        Uri.parse('vnd.youtube://youtu.be/7Kp67gQYQv0?si=MFQCp4bwaCjIrpNR');

    // ignore: deprecated_member_use
    if (await canLaunch(url.toString())) {
      // ignore: deprecated_member_use
      await launch(url.toString(), forceSafariVC: false, forceWebView: false);
    } else {
      // Fallback to open in a browser if the YouTube app is not installed
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'ขนมปังปิ้ง',
    'image': 'pic/toast.jpg',
    'description':
        'ขนมปังปิ้งกรอบราดนม \n\n วิธีทํา\n 1 ปิ้งขนมปังให้กรอบ \n 2 ทาเนยบนขนมปังที่ปิ้งแล้ว\n 3 ผสมนมข้นหวานและนมสดเข้าด้วยกัน แล้วราดลงบนขนมปัง',
    'price': '190 บาท',
  };

  // ฟังก์ชันเพิ่มคะแนนถูกใจ
  void _incrementLike() {
    setState(() {
      likeCount++;
    });
  }

  // ฟังก์ชันเพิ่มคะแนนไม่ถูกใจ
  void _incrementDislike() {
    setState(() {
      dislikeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // เพิ่มปุ่ม Home ใน AppBar
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(
                  context, (route) => route.isFirst); // กลับไปยังหน้าหลัก
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ปุ่มไปยังหน้าอื่น
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page7'); // ไปยังหน้า page7
                  },
                  child: Text('ไปหน้าที่เจ็ด'),
                ),
                SizedBox(height: 20),

                // แสดงรายละเอียดของเมนู
                Text(
                  'รายละเอียดเมนู: ${menuDetails['title']}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  menuDetails['image']!,
                  width: MediaQuery.of(context).size.width *
                      0.8, // ปรับขนาดให้เหมาะสมกับหน้าจอ
                  height: MediaQuery.of(context).size.width *
                      0.5, // ปรับขนาดให้เหมาะสมกับหน้าจอ
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  'คำอธิบาย: ${menuDetails['description']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'ราคา: ${menuDetails['price']}',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(height: 20),

                // แสดงปุ่มถูกใจและไม่ถูกใจ
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up),
                          onPressed: _incrementLike,
                        ),
                        Text('ถูกใจ: $likeCount'),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_down),
                          onPressed: _incrementDislike,
                        ),
                        Text('ไม่ถูกใจ: $dislikeCount'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // ปุ่มเปิด YouTube
                ElevatedButton(
                  onPressed: _launchYouTube, // เมื่อกดปุ่มจะเปิด YouTube
                  child: Text('เปิด YouTube'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page6(title: 'หน้าที่ 6'),
    );
  }
}
