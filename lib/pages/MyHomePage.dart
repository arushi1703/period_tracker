import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'SignInPage.dart';
import 'CalendarPage.dart';
import 'ProfilePage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[500],
        title: Text('Period Tracker'),
        //leading: Icon(Icons.account_circle_rounded),
        actions:<Widget>[
          IconButton(
            onPressed: (){
              //Navigator.push(context,MaterialPageRoute(builder: (context) => const ProfilePage(title: 'Profile',)));
            },
            icon: const Icon(
              Icons.settings,
              size: 32,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 60,
              ),
            ),
            ListTile(
              title: Text(user.email!),
              onTap: () {},
            ),
            ListTile(
              title: const Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
                //Navigator.push(context,MaterialPageRoute(builder: (context) => const main(title: 'Home',)));
              },
            ),
            ListTile(
              title: const Text('P R O F I L E'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ProfilePage(title: 'My Profile')));
              },
            ),
            ListTile(
              title: const Text('C A L E N D A R'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const CalendarPage(title: 'Calendar',)));
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/appbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child:Text(
                  '"Periods: A monthly reminder of your bodys resilience and grace~"',
                  style: GoogleFonts.dancingScript(
                    textStyle: TextStyle(
                      color: Colors.pink,
                      letterSpacing: .5,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                width: 390.0,
                height: 100.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border:Border.all(
                    color: Colors.pink,
                    width: 3.0,
                  ),
                ),
                child: Text(
                  'Next period in 2 days\nLast cycle duration: 29 days',
                  style:GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontSize: 26,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 400.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    border:Border.all(
                      color: Colors.pink,
                      width: 3.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage("images/padstock.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text(
                        'Pad Stock',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text(
                          'SHOP NOW',
                          style: TextStyle(
                            color:Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                child:Container(
                  padding: const EdgeInsets.all(5),
                  width: 200.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border:Border.all(
                      color: Colors.pink,
                      width: 3.0,
                    ),
                  ),
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Background color
                    ),
                    child: const Text(
                      'Log Period',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const CalendarPage(title: 'Calendar',)));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
