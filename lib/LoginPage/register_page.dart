import 'package:flutter/material.dart';
import 'package:musicapp/LoginPage/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true; // เริ่มต้นการปิดรหัสผ่าน

  // สร้างฟังก์ชันสำหรับแสดง AlertDialog
  void _showErrorDialog(BuildContext context) {
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

      //body images
      body: Container(
        child: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
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
                        Center(
                          child: Text(
                            'Register',
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
                        SizedBox(height: 20),
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
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // Toggle password visibility
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          obscureText: _obscurePassword,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            } else {
                              _showErrorDialog(
                                  context); // เรียกใช้งานฟังก์ชันแสดง AlertDialog
                            }
                          },
                          child: Text('Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800])),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Login Now ?',
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
      ),
    );
  }
}
