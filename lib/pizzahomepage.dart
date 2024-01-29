// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pizzaclass.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/me.jpg"), fit: BoxFit.cover),
                  color: Color.fromARGB(255, 56, 142, 142),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "images/pic.jpg",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const Text(
                        "Spike Beebop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "SpikeBeebop@e-polytechnique.ma",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      // Add other user information or customize as needed
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.green[700],
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text("this is my subtitle"),
                trailing: const Icon(Icons.arrow_right),
                // onTap: () => _onItemTapped(0),
              ),
              ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.green[700],
                ),
                title: Text(
                  "Mail",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text("this is my subtitle"),
                trailing: const Icon(Icons.arrow_right),
                // onTap: () => _onItemTapped(1),
              ),
              ListTile(
                leading: Icon(
                  Icons.send,
                  color: Colors.green[700],
                ),
                title: Text(
                  "SentItem",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text("this is my subtitle"),
                trailing: const Icon(Icons.arrow_right),
                // onTap: () => _onItemTapped(2),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text("this is my subtitle"),
                trailing: const Icon(Icons.arrow_right),
                // ignore: avoid_print
                // onTap: () => _onItemTapped(3),
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: Colors.green[700],
                ),
                title: Text(
                  "Calender",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text("this is my subtitle"),
                trailing: const Icon(Icons.arrow_right),
                // ignore: avoid_print
                // onTap: () => _onItemTapped(4),
              )
            ],
          ),
        ),
        appBar: AppBar(
            elevation: 200,
            title: const Text(
              'Pizza Haaat',
              style: TextStyle(color: Color.fromARGB(255, 255, 252, 252)),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 255, 151, 99)),
        body: FutureBuilder<List<Pizza>>(
            future: loadPizzas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Pizza> pizzas = snapshot.data!;
                return ListView.builder(
                  itemCount: pizzas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(5),
                      color: const Color.fromARGB(255, 244, 255, 254),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: Image.asset(pizzas[index].imageUrl),
                        title: Text(
                          pizzas[index].name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.arrow_circle_right_outlined),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(
                                pizzaName: pizzas[index].name,
                                pizzaPrice: pizzas[index].price,
                                pizzaDescription: pizzas[index].components,
                                pizzaurl: pizzas[index].imageUrl,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(" Error:  ${snapshot.error}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                );
              }
            }));
  }
}

Future<List<Pizza>> loadPizzas() async {
  // Load JSON file
  String jsonString = await rootBundle.loadString('lib/pizzalist.json');

  // Parse JSON
  List<dynamic> jsonList = json.decode(jsonString);

  // Convert JSON list to a list of Pizza objects
  List<Pizza> pizzas = jsonList.map((json) => Pizza.fromJson(json)).toList();

  return pizzas;
}
