import 'package:flutter/material.dart';
import 'Page1.dart'; // นำเข้าไฟล์ Page1
import 'Page2.dart'; // นำเข้าไฟล์ Page2
import 'Page3.dart'; // นำเข้าไฟล์ Page3
import 'Page4.dart'; // นำเข้าไฟล์ Page4
import 'Page5.dart'; // นำเข้าไฟล์ Page5
import 'Page6.dart'; // นำเข้าไฟล์ Page6
import 'Page7.dart'; // นำเข้าไฟล์ Page7

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แนะนำอาหารและของว่าง',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // เส้นทางเริ่มต้นไปหน้าแรก
      routes: {
        '/': (context) => HomeScreen(), // หน้า HomeScreen แสดงเมนูอาหาร
        '/page1': (context) => Page1(title: 'สเต็กเนื้อ'),
        '/page2': (context) => Page2(title: 'สปาเก็ตตี้'),
        '/page3': (context) => Page3(title: 'มักกะโรนี'),
        '/page4': (context) => Page4(title: 'กุ้งอบชีส'),
        '/page5': (context) => Page5(title: 'บิงซูสตอเบอร์รี่'),
        '/page6': (context) => Page6(title: 'ขนมปังปิ้ง'),
        '/page7': (context) => Page7(title: 'ไอศกรีมรสนม'),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
 
  final List<Map<String, String>> foodItems = [
    {
      'image': 'pic/steak.jpg',
      'icon': 'Icons.restaurant_menu', 
      'title': 'สเต็กเนื้อ',
    },
    {
      'image': 'pic/spaghetti.jpg',
      'icon': 'Icons.pasta', 
      'title': 'สปาเก็ตตี้',
    },
    {
      'image': 'pic/Macaroni.jpg',
      'icon': 'Icons.fastfood', 
      'title': 'มักกะโรนีไส้กรอก',
    },
    {
      'image': 'pic/shrimp.jpg',
      'icon': 'Icons.seafood', 
      'title': 'กุ้งอบชีส',
    },
  ];


  final List<Map<String, String>> snackItems = [
    {
      'image': 'pic/bingsu.jpg',
      'icon': 'Icons.icecream', 
      'title': 'บิงซูสตอเบอร์รี่',
    },
    {
      'image': 'pic/toast.jpg',
      'icon': 'Icons.toast', 
      'title': 'ขนมปังปิ้ง',
    },
    {
      'image': 'pic/icecream.jpg',
      'icon': 'Icons.icecream', 
      'title': 'ไอศกรีมรสนม',
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูอาหารและของว่าง'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'อาหารแนะนำ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            
            Container(
              height: screenHeight * 0.3, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return GestureDetector(
                    onTap: () {
                   
                      Navigator.pushNamed(context, '/page${index + 1}');
                    },
                    child: Center( 
                      child: Card(
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 12.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          width: screenWidth * 0.6, 
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Image.asset(
                                item['image']!,
                                width: screenWidth * 0.5, 
                                height: screenWidth * 0.5, 
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 12),
                            
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 
                                  IconButton(
                                    onPressed: () {
                                      
                                      Navigator.pushNamed(context, '/page${index + 1}');
                                    },
                                    icon: Icon(
                                      Icons.restaurant_menu, 
                                      size: 24, 
                                      color: Colors.blue,
                                    ),
                                  ),
                              
                                  Text(
                                    item['title']!,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0), 
            ),
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ของว่างแนะนำ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            
            Container(
              height: screenHeight * 0.3, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snackItems.length,
                itemBuilder: (context, index) {
                  final item = snackItems[index];
                  return GestureDetector(
                    onTap: () {
                     
                      Navigator.pushNamed(context, '/page${index + 5}');
                    },
                    child: Center( 
                      child: Card(
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 12.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          width: screenWidth * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Image.asset(
                                item['image']!,
                                width: screenWidth * 0.5, 
                                height: screenWidth * 0.5, 
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 12),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 
                                  IconButton(
                                    onPressed: () {
                                     
                                      Navigator.pushNamed(context, '/page${index + 5}');
                                    },
                                    icon: Icon(
                                      Icons.icecream, 
                                      size: 24,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  
                                  Text(
                                    item['title']!,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}