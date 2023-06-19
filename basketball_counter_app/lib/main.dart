import 'package:flutter/material.dart';

void main() {
  runApp(BasketballApp());
}

class BasketballApp extends StatefulWidget {
  @override
  State<BasketballApp> createState() => _BasketballAppState();
}

class _BasketballAppState extends State<BasketballApp> {
  int teamAPoints = 0;

  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pionts Counter"),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Team A",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '$teamAPoints',
                      style: TextStyle(
                        fontSize: 150,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130, 40)),
                      onPressed: () {
                        setState(() {
                          teamAPoints++;
                        });
                        print("$teamAPoints");
                      },
                      child: Text(
                        'add 1 point',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130, 40)),
                      onPressed: () {
                        setState(() {});
                        teamAPoints = teamAPoints + 2;
                      },
                      child: Text(
                        'add 2 points',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130, 40)),
                      onPressed: () {
                        setState(() {
                          teamAPoints = teamAPoints + 3;
                        });
                      },
                      child: Text(
                        'add 3 points',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  child: VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Team B",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      "$teamBPoints",
                      style: TextStyle(
                        fontSize: 150,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130, 40)),
                      onPressed: () {
                        setState(() {
                          teamBPoints++;
                        });
                      },
                      child: Text(
                        'add 1 point',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130, 40)),
                      onPressed: () {
                        setState(() {
                          teamBPoints += 2;
                        });
                      },
                      child: Text(
                        'add 2 points',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(130, 40)),
                      onPressed: () {
                        setState(() {
                          teamBPoints += 3;
                        });
                      },
                      child: Text(
                        'add 3 points',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, minimumSize: Size(130, 40)),
              onPressed: () {
                setState(() {
                  teamAPoints = 0;
                  teamBPoints = 0;
                });
              },
              child: Text(
                'Rest',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
