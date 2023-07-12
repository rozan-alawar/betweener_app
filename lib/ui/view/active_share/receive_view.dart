import 'package:betweener_app/app/locator.dart';
import 'package:betweener_app/app/router/navigation_service.dart';
import 'package:betweener_app/app/router/route_constants.dart';
import 'package:betweener_app/ui/customwidgets/sizedbox_custom.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const CustomSizedBox(height: 20),
            const Text(
              'Active Sharing',
              style: TextStyle(
                color: Color(0xFF2D2B4E),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomSizedBox(height: 40),
            Image(
              image: const AssetImage('assets/imgs/activesharing.png'),
              width: MediaQuery.of(context).size.width * (1 / 3),
              height: MediaQuery.of(context).size.height * 0.24,
            ),
            const CustomSizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      height: 48,
                      width: 276,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7E5F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo(RouteConstants.friendProfile);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.person_sharp, color: Colors.black),
                            const CustomSizedBox(
                              height: 8,
                            ),
                            Text(
                              '${users[index]['username']}',
                              style: const TextStyle(color: Colors.black),
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
