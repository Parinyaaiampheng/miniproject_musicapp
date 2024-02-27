import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P R O F I L E'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage:
                          AssetImage('assets/images/proflie.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            String newImagePath =
                                ''; // กำหนดตัวแปรเก็บที่อยู่รูปภาพใหม่

                            return AlertDialog(
                              title: Text('แก้ไขรูปโปรไฟล์'),
                              content: TextFormField(
                                onChanged: (value) {
                                  newImagePath = value;
                                },
                                decoration: InputDecoration(
                                  labelText: 'image URL',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // เพิ่มโค้ดเพื่ออัปเดตรูปภาพด้วย newImagePath
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: [
               Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text('Email',style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('gmail123@gmail.com'),
                    trailing: Icon(Icons.email),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text('Password',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('12345'),
                    trailing: Icon(Icons.calendar_today),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
