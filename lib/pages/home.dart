import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_11/colors.dart';
import 'package:flutter_application_11/pages/control.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          ChooseGender(
            isMale: true,
            icon: Icons.male,
            text: "Male",
          ),
          ChooseGender(
            isMale: false,
            icon: Icons.female,
            text: "Female",
          ),
        ],
      )),
    );
  }
}

class ChooseGender extends StatelessWidget {
  bool isMale;
  String text;
  IconData icon;
  ChooseGender(
      {super.key,
      required this.isMale,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    Color mainColor = isMale ? kblue : kred;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ControlPage(
                        isMale: isMale,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(color: mainColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 110,
                color: Colors.white,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
