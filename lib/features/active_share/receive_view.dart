import '/features/active_share/profile_friend.dart';
import 'package:flutter/material.dart';

class ReceiveView extends StatefulWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  List<Map<String, String>> users = [
    {'username': 'AHMED ALI'},
    {'username': 'AHMED ALI'},
    {'username': 'AHMED ALI'}
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Active Sharing',
              style: TextStyle(
                color: Color(0xFF2D2B4E),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Image(
              image: AssetImage('assets/imgs/activesharing.png'),
              width: MediaQuery.of(context).size.width * (1 / 3),
              height: MediaQuery.of(context).size.height * 0.24,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: 48,
                      width: 276,
                      decoration: BoxDecoration(
                        color: Color(0xFFE7E5F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, FriendProfileView.id);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.person_sharp, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              '${users[index]['username']}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
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
