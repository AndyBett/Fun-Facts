import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funfacts/Screens/settings_screen.dart';
import 'package:dio/dio.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<dynamic> facts = [];
  bool isLoading = true;

  void getData() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/AndyBett/flutter_dummy_api/refs/heads/master/facts.json");

      facts = jsonDecode(response.data);
      isLoading = false;

      setState(() {});
    } catch (e) {
      isLoading = false;
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  // api url https://raw.githubusercontent.com/AndyBett/flutter_dummy_api/refs/heads/master/facts.json

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fun Facts"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SettingsScreen();
                  }));
                },
                child: const Icon(Icons.settings)),
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: isLoading
              ? Center(child: const CircularProgressIndicator())
              : PageView.builder(
                  itemCount: facts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Text(
                      facts[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35),
                    ));
                  }),
        ),
        Container(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Swipe left for more"),
          ),
        )
      ]),
    );
  }
}
