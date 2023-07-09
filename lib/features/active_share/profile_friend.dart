import 'package:flutter/material.dart';

class FriendProfileView extends StatefulWidget {
  const FriendProfileView({super.key});

  @override
  State<FriendProfileView> createState() => _FriendProfileViewState();
  static String id = '/profile_friend';
}

class _FriendProfileViewState extends State<FriendProfileView> {
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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF2D2B4E),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
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
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * (283 / 360),
              height: MediaQuery.of(context).size.height * (150 / 800),
              decoration: const BoxDecoration(
                  color: Color(0xFF2D2B4E),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/imgs/profile.png",
                    ),
                    maxRadius: 40,
                  ),
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      const Text(
                        'example@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 66,
                          height: 24,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFD465),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: const Center(
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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: links.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: Container(
                        width: MediaQuery.of(context).size.width * (296 / 360),
                        height: MediaQuery.of(context).size.height * (80 / 800),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.redAccent.shade100
                              : const Color.fromARGB(255, 204, 199, 232),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${links[index]['name']}',
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${links[index]['link']}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        )),
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
