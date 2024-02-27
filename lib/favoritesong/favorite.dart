import 'package:flutter/material.dart';

class FavoriteSong extends StatelessWidget {
  const FavoriteSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favoriteSongs = [
      {"title": "Doja - Cee", "image": "assets/images/cee.jpg"},
      {
        "title": "ขี้หึง - Silly Fools",
        "image": "assets/images/sillyfools.jpg"
      },
      {
        "title": "Congratulations - Post Malone",
        "image": "assets/images/9.jpg"
      },
      {
        "title": "Die For You - The Weeknd",
        "image": "assets/images/wekeeknd.jpg"
      },
      {
        "title": "In the End - Linkin Park",
        "image": "assets/images/in the end.jpg"
      },
      {"title": "Sunflower - Post Malone", "image": "assets/images/8.jpg"},
      {
        "title": "ผิดที่ไว้ใจ - Silly Fools",
        "image": "assets/images/sillyfools.jpg"
      },
      {"title": "Save Your - The Weeknd", "image": "assets/images/2.jpg"},
      {"title": "Percy - Shall we", "image": "assets/images/10.jpg"},
      {
        "title": "The Lazy Song - Bruno Mars",
        "image": "assets/images/bruno.jpg"
      },
      // เพิ่มเพลงที่ชอบเพิ่มเติมตามต้องการ
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.music_note_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,), // เพิ่มไอคอนด้านซ้ายของชื่อเรื่อง
            SizedBox(width: 5), // ระยะห่างระหว่างไอคอนและข้อความ
            Container(child: Text('F A V O R I T E   S O N G',
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),)),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteSongs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // มุมโค้ง
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              padding: EdgeInsets.all(5.0), // การเพิ่ม padding รอบข้อความ
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(favoriteSongs[index]["image"]),
                  ),
                  SizedBox(width: 25), // ระยะห่างระหว่างข้อความและรูปภาพ
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0), // พื้นที่ว่างด้านซ้ายของข้อความ
                      child: Text(
                        favoriteSongs[index]["title"],
                        textAlign: TextAlign.center, // จัดให้ข้อความตรงกลาง
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // ตัวหนา
                          fontSize: 15,
                          color: Colors.grey.shade800, // สีข้อความ
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
