import 'package:dudhaganga_app/constants.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        title: const Text('Home '),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PhysicalModel(
                  color: themeData.backgroundColor,
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/sunset.jpg',
                        ),
                      ),
                      title: const Text('9 Sup 2022'),
                      subtitle: const Text("Morning"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(8.0),
                        color: themeData.backgroundColor,
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text('Collected Milk:'),
                              Text(
                                '34 L',
                                style: TextStyle(fontSize: 32.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(8.0),
                        color: themeData.backgroundColor,
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('Remaining Farmers:'),
                              Text(
                                '21',
                                style: TextStyle(fontSize: 32.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(8.0),
                        color: themeData.backgroundColor,
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text('Sold Milk:'),
                              Text(
                                '8 L',
                                style: TextStyle(fontSize: 32.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(8.0),
                        color: themeData.backgroundColor,
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(child: Text('No. of Customers:')),
                              Text(
                                '14',
                                style: TextStyle(fontSize: 32.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
