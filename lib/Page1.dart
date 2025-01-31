import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int likeCount = 0;
  int dislikeCount = 0;

  void _launchYouTube() async {
    final Uri url = Uri.parse('vnd.youtube://www.youtube.com/watch?v=JvBUqL6Mwyg');
    
    if (await canLaunch(url.toString())) {
      await launch(url.toString(), forceSafariVC: false, forceWebView: false);
    } else {
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'สเต็กเนื้อ',
    'image': 'pic/steak.jpg',
    'description': 'สเต็กเนื้อ (Wagyu Angus Shoulder Steak) \n\n วิธีทำสเต็กสันไหล่เนื้อวากิวแองกัส \n 1 เตรียมเนื้อ: ทิ้งเนื้อไว้ที่อุณหภูมิห้อง 15-20 นาที และปรุงรสด้วยเกลือและพริกไทย \n 2 ย่าง: ใช้กระทะร้อน ใส่น้ำมันแล้วย่างเนื้อ 3-4 นาทีต่อด้าน (ตามความชอบ) \n 3 พักเนื้อ: ให้เนื้อพัก 5-10 นาทีหลังย่าง \n 4 เสิร์ฟ: เสิร์ฟพร้อมมันฝรั่งหรือผักย่างและซอสตามชอบ',
    'price': '150 บาท',
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
              Navigator.pop(context);  // กลับไปหน้าหลัก
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
                    Navigator.pushNamed(context, '/page2');  // ไปยังหน้า page2
                  },
                  child: Text('ไปหน้าที่สอง'),
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
                  width: MediaQuery.of(context).size.width * 0.8, // ปรับขนาดให้เหมาะสมกับหน้าจอ
                  height: MediaQuery.of(context).size.width * 0.5, // ปรับขนาดให้เหมาะสมกับหน้าจอ
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
                  onPressed: _launchYouTube,  // เมื่อกดปุ่มจะเปิด YouTube
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(title: 'หน้าแรก'),
    );
  }
}
