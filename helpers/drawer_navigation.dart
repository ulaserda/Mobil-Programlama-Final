import 'package:flutter/material.dart';
import 'package:to_do_list/screens/add_to_list.dart';
import 'package:to_do_list/screens/my_home_screen.dart';

class DrawerNavigation extends StatefulWidget{
  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Ulaş Erdağı'), accountEmail: Text('ulaserdagi@gmail.com'),
            arrowColor: Colors.deepPurpleAccent,
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://data2.nssmag.com/images/galleries/41148/cover/cover-chill-tall_v2.jpg'),
            ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomeScreen()));
               },
            ),
            ListTile(
              title: Text("Ekle/Çıkar"),
              leading: Icon(Icons.add),
              onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddToList()));
              },
            ),
             
          ],
        )
       
      ),
    );
  }
}