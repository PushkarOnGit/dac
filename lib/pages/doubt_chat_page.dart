import 'package:flutter/material.dart';

class DoubtChats extends StatefulWidget {
  const DoubtChats({super.key});

  @override
  State<DoubtChats> createState() => _DoubtChatsState();
}

class _DoubtChatsState extends State<DoubtChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Doubt Chats', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
