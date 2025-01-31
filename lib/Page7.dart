// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url =
        Uri.parse('vnd.youtube://youtu.be/HQZdrjtW4zU?si=fKtDSY7XMeIryqDx');

    // ignore: deprecated_member_use
    if (await canLaunch(url.toString())) {
      // ignore: deprecated_member_use
      await launch(url.toString(), forceSafariVC: false, forceWebView: false);
    } else {
      // Fallback to open in a browser if the YouTube app is not installed
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนูแรก
  final Map<String, String> menuDetails = {
    'title': 'ไอศครีมนม',
    'image': 'pic/icecream.jpg', // ใช้ URL ของภาพหรือจัดเก็บใน assets
    'description':
        'ขนมปังปิ้งกรอบราดนม \n\n วิธีทํา\n 1 ปิ้งขนมปังให้กรอบ \n 2 ทาเนยบนขนมปังที่ปิ้งแล้ว\n 3 ผสมนมข้นหวานและนมสดเข้าด้วยกัน แล้วราดลงบนขนมปัง',
    'price': '100 บาท',
  };

  void _incrementLike() {
    setState(() {
      likeCount++;
    });
  }

  void _incrementDislike() {
    setState(() {
      dislikeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
      body: Center(
        child: SingleChildScrollView(
          // Make the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Navigate to the home page button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('ไปหน้าแรก'),
                ),
                SizedBox(height: 20),

                // Display the menu details
                Text(
                  'รายละเอียดเมนู: ${menuDetails['title']}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                // Image section with dynamic sizing based on screen width and height
                Image.asset(
                  menuDetails['image']!,
                  width:
                      screenWidth * 0.6, // Dynamic width (60% of screen width)
                  height: screenHeight *
                      0.3, // Dynamic height (30% of screen height)
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),

                // Description section
                Text(
                  'คำอธิบาย: ${menuDetails['description']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),

                // Price section
                Text(
                  'ราคา: ${menuDetails['price']}',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(height: 20),

                // Like/Dislike buttons
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

                // Button to open YouTube
                ElevatedButton(
                  onPressed:
                      _launchYouTube, // When pressed, it will open YouTube
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
      home: Page7(title: 'หน้าที่7'),
    );
  }
}
