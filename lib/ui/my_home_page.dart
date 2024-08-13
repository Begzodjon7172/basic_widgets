import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myText = "";
  String removedText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    myText,
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    "Add number",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      circle("1", ""),
                      circle("2", "ABC"),
                      circle("3", "DEF"),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      circle("4", "GHI"),
                      circle("5", "JKL"),
                      circle("6", "MNO"),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      circle("7", "PQRS"),
                      circle("8", "TUV"),
                      circle("9", "WXYZ"),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      circle("*", ""),
                      circle("0", "+"),
                      circle("#", ""),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  lastRow(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  writeText(String number) {
    setState(() {
      myText = myText.length >= 15 ? "" : myText + number;
    });
  }

  deleteText() {
    setState(() {
      removedText = myText.substring(0, myText.length);
      myText = removedText;
    });
  }

  Widget circle(String number, String sign) {
    return InkWell(
      onTap: () {
        writeText(number);
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 214, 198, 198),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              sign,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 80.0,
          height: 80.0,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.call,
            size: 32,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              myText.substring(0, myText.length);
            });
          },
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.backspace,
              size: 36,
              color: Color.fromARGB(255, 202, 183, 183),
            ),
          ),
        ),
      ],
    );
  }
}
