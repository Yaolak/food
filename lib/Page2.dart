import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url = Uri.parse('vnd.youtube://youtu.be/bkMFerlrnUM?si=m5CprdD1z2qneFrG');
  
    if (await canLaunch(url.toString())) {
      await launch(url.toString(), forceSafariVC: false, forceWebView: false);
    } else {
      // Fallback to open in a browser if the YouTube app is not installed
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'สปาเก็ตตี้',
    'image': 'pic/spaghetti.jpg',
    'description': 'สปาเก็ตตี้มะเขือเทศ \n\n วิธีทำสปาเก็ตตี้มะเขือเทศ \n 1 ต้มสปาเก็ตตี้ในน้ำเดือดจนสุกแล้วสะเด็ดน้ำ\n 2 ผัดกระเทียมและหอมใหญ่ในน้ำมันมะกอกจนหอม ใส่มะเขือเทศหั่นหรือซอสมะเขือเทศ ผัดจนเดือด \n 3 ใส่เส้นสปาเก็ตตี้ลงไปผัดกับซอสให้เข้ากัน\n 4 เสิร์ฟโรยใบโหระพาและชีสพาร์มีซาน',
    'price': '189 บาท',
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
                    Navigator.pushNamed(context, '/page3');  // ไปยังหน้า page3
                  },
                  child: Text('ไปหน้าที่สาม'),
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
      home: Page2(title: 'หน้าที่ 2'),
    );
  }
}
