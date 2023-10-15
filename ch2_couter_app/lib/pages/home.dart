import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75,
            width: double.infinity,
            child: const Center(
              child: Text("Bottom"),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 40.0,
                    width: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                      height: 40.0,
                      width: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                  ),
                  Container(
                    color: Colors.brown,
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: 60.0,
                        width: 60.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                      ),
                      Container(
                        color: Colors.amber,
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                      ),
                      Container(
                        color: Colors.brown,
                        height: 20.0,
                        width: 20.0,
                      ),
                      Divider(),
                      Row(
                        children: [
// Next step we'll add more widgets
                          CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            radius: 100,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  color: Colors.yellow,
                                ),
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  color: Colors.amber,
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  color: Colors.brown,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text('End of the Line'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
