import 'package:flutter/material.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 20),
            // column 1
            Text(
              'Settings',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            // column 2
            Row(
              children: [
                // row 1
                // row 2
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      'Mr. John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),

                // row 3
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout, size: 30, color: Colors.red),
                ),
              ],
            ),
            // Divider
            Divider(color: Colors.grey.shade300, height: 70),
            ListTile(
              leading: Icon(Icons.person, size: 40),
              title: Text(
                'User Profil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Divider(color: Colors.grey.shade300, height: 30),
            ListTile(
              leading: Icon(Icons.settings, size: 40),
              title: Text(
                'Change Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Divider(color: Colors.grey.shade300, height: 30),
            ListTile(
              leading: Icon(Icons.question_mark, size: 40),
              title: Text(
                'FAQs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Divider(color: Colors.grey.shade300, height: 30
            ),
          ],
        ),
      ),
    );
  }
}