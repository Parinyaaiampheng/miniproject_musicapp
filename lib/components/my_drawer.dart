import 'package:flutter/material.dart';
import 'package:musicapp/LoginPage/login.dart';
import 'package:musicapp/favoritesong/favorite.dart';
import 'package:musicapp/pages/settings_page.dart';
import 'package:musicapp/proflie/proflie.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "M U S I C  A P P",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25 // ตัวหนา
                      ),
                ),
                Image.asset(
                  'assets/images/music two.png', //รูปภาพ
                  height: 75,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
          ),

          //Proflie
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 0),
            child: ListTile(
              title: const Text("P R O F L I E"),
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
          ),

          //favorite song
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 20),
            child: ListTile(
              title: const Text("F A V O R I T E  S O N G"),
              leading: Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteSong(),
                  ),
                );
              },
            ),
          ),

          //settings title
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 20),
            child: ListTile(
              title: const Text("S E T T I N G S   T H E M E"),
              leading: const Icon(Icons.settings, color: Colors.blue),
              onTap: () {
                //pop drawer
                Navigator.pop(context);

                //navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),

          

          Padding(
            padding: const EdgeInsets.only(left: 0, top: 200),
            child: ListTile(
              title: const Text("L o g o u t"),
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(
                Icons.home,
              ),
              onTap: () {
                //pop drawer
                Navigator.pop(context);

                //navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
