import 'package:flutter/material.dart';
import 'package:musicapp/LoginPage/register_page.dart';
import 'package:musicapp/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // สร้างตัวแปรสำหรับเก็บอีเมลและรหัสผ่าน
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // สร้างตัวแปรเพื่อเก็บสถานะการมองเห็นรหัสผ่าน
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Music App
      appBar: AppBar(
        automaticallyImplyLeading: false, // เอาปุ่มย้อนกลับออก
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Music App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 45,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.white.withOpacity(0.5),
                    offset: Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10), // เพิ่มระยะห่างระหว่างข้อความและรูปภาพ

            Image.asset(
              'assets/images/music two.png', // ตัวอย่างเส้นรัศมี
              width: 50, // ขนาดของรูปภาพ
              height: 50,
              color: Colors.white.withOpacity(0.5), // กำหนดสีของรูปภาพ
            ),
          ],
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
        elevation: 8,
        backgroundColor: Colors.transparent, // กำหนดสีพื้นหลังเป็นโปร่งแสง
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          ),
        ),
      ),

      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30.0), // เพิ่มความโค้งให้กับการ์ด
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // ข้อความ Login
                      Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 45,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20), // เพิ่มระยะห่าง

                      // ช่องใส่อีเมล
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'โปรดกรอกอีเมลของท่าน';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'โปรดกรอกอีเมลให้ถูกต้อง';
                          }
                          if (!value.endsWith('@gmail.com')) {
                            return 'โปรดกรอกอีเมลที่มีรูปแบบ @gmail.com';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20), // เพิ่มระยะห่าง

                      // ช่องใส่รหัสผ่าน
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          // เพิ่มไอคอนดวงตาเพื่อแสดง/ซ่อนรหัสผ่าน
                          suffixIcon: IconButton(
                            icon: Icon(
                              // ถ้ารหัสผ่านมองเห็นได้ให้แสดงไอคอน visibility_off
                              // ถ้ารหัสผ่านถูกซ่อนให้แสดงไอคอน visibility
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // เมื่อคลิกที่ไอคอนดวงตา
                              setState(() {
                                // เปลี่ยนสถานะการมองเห็นรหัสผ่าน
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                        // ทำให้รหัสผ่านแสดงเป็นจุดหรือข้อความ
                        obscureText: !passwordVisible,
                      ),

                      SizedBox(height: 20), // เพิ่มระยะห่าง

                      // ปุ่มเข้าสู่ระบบ
                      ElevatedButton(
                        onPressed: () {
                          // เช็ครหัสผ่าน
                          if (passwordController.text == '12345') {
                            // เมื่อรหัสผ่านถูกต้อง ให้เปลี่ยนหน้าไปที่ HomePage และลบหน้า LoginPage ออกจาก stack
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          } else {
                            // กรณีรหัสผ่านไม่ถูกต้อง สามารถเพิ่มการแจ้งเตือนหรือการจัดการอื่น ๆ ตามความต้องการ
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    'ผิดพลาด !',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  content: Text(
                                    'โปรดกรอกข้อมูลของท่านให้ถูกต้อง!',
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800])),
                      ),
                      SizedBox(height: 20), // เพิ่มระยะห่าง
                      // ข้อความสำหรับลงทะเบียน
                      TextButton(
                        onPressed: () {
                          // เมื่อคลิกปุ่ม Register ให้เปลี่ยนไปยังหน้าลงทะเบียน
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Register Now ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
