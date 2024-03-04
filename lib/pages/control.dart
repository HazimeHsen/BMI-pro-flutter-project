// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_11/colors.dart';
import 'package:flutter_application_11/pages/result.dart';

class ControlPage extends StatefulWidget {
  bool isMale;
  ControlPage({super.key, required this.isMale});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int weight = 5;
  int height = 40;
  @override
  Widget build(BuildContext context) {
    Color MainColor = widget.isMale ? kblue : kred;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 60, horizontal: 15),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                          ),
                          const Text(
                            "BMI",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      (widget.isMale ? "Male" : "Female"),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      widget.isMale ? Icons.male : Icons.female,
                      color: MainColor,
                      size: 60,
                    ),
                    const Text(
                      "Weight (KG)",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        child: ListView.builder(
                          itemCount: 50,
                          itemBuilder: (context, index) {
                            int count = (index + 1) * 5;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight = count;
                                  });
                                  print(weight);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: weight == count
                                            ? Colors.white
                                            : MainColor,
                                        border: weight == count
                                            ? Border.all(
                                                color: MainColor, width: 4)
                                            : null),
                                    width: 50,
                                    height: 60,
                                    child: Center(
                                      child: Text(
                                        "$count",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: weight == count
                                                ? MainColor
                                                : Colors.white),
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(color: MainColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 15),
                  child: Column(
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const Text(
                        "(CM)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: 60,
                            itemBuilder: (context, index) {
                              int count = (index + 1) * 5;
                              return Container(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      height = count;
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: (height == count)
                                              ? Colors.white
                                              : MainColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 50,
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          "$count",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: height == count
                                                  ? MainColor
                                                  : Colors.white),
                                        ),
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          Positioned(
              bottom: 20,
              right: MediaQuery.sizeOf(context).width * 1 / 3 - 43,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                height: height,
                                weight: weight,
                                isMale: widget.isMale,
                              )));
                },
                child: Text("Calc"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    backgroundColor: kyellow,
                    foregroundColor: Colors.white,
                    elevation: 3),
              ))
        ],
      ),
    );
  }
}
