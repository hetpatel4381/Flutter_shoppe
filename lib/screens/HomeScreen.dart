import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shoppe/screens/Category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/photo.jpg"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          child: Text(
                            "Hello,",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 18),
                          ),
                        ),
                        const Text("Het Patel",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 370,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey.shade700,
                ),
                Text(
                  "Search Product Here",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                )
              ],
            ),
          ),
        ),
        Categories(),
      ],
    ));
  }
}
