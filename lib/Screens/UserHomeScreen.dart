import 'package:flutter/material.dart';

class Userhomescreen extends StatefulWidget {
  const Userhomescreen({super.key});

  @override
  State<Userhomescreen> createState() => _UserhomescreenState();
}

class _UserhomescreenState extends State<Userhomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' user Home Screen')),
      body: const Center(child: Text('Welcome to VoiceFirst!')),
    );
  }
}
