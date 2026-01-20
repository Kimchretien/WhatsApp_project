import 'package:appli01/pages/conversation.dart';
//import 'package:appli01/messages/messages.dart';
import 'package:flutter/material.dart';

class DiscussionsPage extends StatelessWidget {
   final List<Map<String, dynamic>> conversations;
  const DiscussionsPage({super.key, required this.conversations});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConversationsPage(conversations: conversations) ,
    );
  }
}