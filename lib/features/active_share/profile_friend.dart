import 'package:flutter/material.dart';

class profile_friend extends StatefulWidget {
  const profile_friend({super.key});

  @override
  State<profile_friend> createState() => _profile_friendState();
  static String id = '/profile_friend';
}

class _profile_friendState extends State<profile_friend> {
  List<Map<String, String>> links = [
    {
      'name': 'I N S T A G R A M',
      'link': 'https://www.instagram.com/a7medhq/',
    },
    {
      'name': 'I N S T A G R A M',
      'link': 'https://www.instagram.com/a7medhq/',
    },
    {
      'name': 'I N S T A G R A M',
      'link': 'https://www.instagram.com/a7medhq/',
    },
    {
      'name': 'I N S T A G R A M',
      'link': 'https://www.instagram.com/a7medhq/',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF2D2B4E),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Ahmed Ali',
          style: TextStyle(
              color: Color(0xFF2D2B4E),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * (283 / 360),
              height: MediaQuery.of(context).size.height * (150 / 800),
              decoration: BoxDecoration(
                  color: Color(0xFF2D2B4E),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/imgs/profile.png",
                    ),
                    maxRadius: 40,
                  ),
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(
                        'example@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 66,
                          height: 24,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFD465),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: Center(
                            child: Text(
                              'follow',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xFF2D2B4E)),
                            ),
                          )),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: links.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * (296 / 360),
                      height: MediaQuery.of(context).size.height * (80 / 800),
                      decoration: BoxDecoration(
                        color: index%2==0 ? Colors.redAccent.shade100:Color.fromARGB(255, 204, 199, 232),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${links[index]['name']}',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${links[index]['link']}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      )
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
