import 'package:flutter/material.dart';

class MyProfile extends StatefulWidge {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 20,),
            // col 1
            Text(
              'Setting',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50,),
            // col 2
            Row(
              children: [
                // row 1
                Image.asset('asset/images/profile.png', height: 70,),
                // row 2
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(color: Colors.grey, fontSize: 20)
                      ),
                      Text(
                        'Mr. Andreas Don',
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
                   icon: Icon(Icons.logout, size: 30, color: Colors.red,),
                   ),
                 ],
               ),
               // divinder
               Divider(color: Colors.grey.shade300, height: 60,),
               ListTile(
                leading: Icon(Icons.person, size: 40),
                title: Text(
                  'User Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(
                  onPressed: () {},  
                icon: Icon(Icons.arrow_forward_ios),
                ),
               ),
               Divider(color: Colors.grey.shade300, )
             ]
        