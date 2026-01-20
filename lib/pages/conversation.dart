import 'package:flutter/material.dart';

class ConversationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> conversations;

  const ConversationsPage({
    super.key,
    required this.conversations,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        final convo = conversations[index];

        return ListTile(
          onTap: () {
            
          },
          leading: CircleAvatar(
  backgroundImage: AssetImage('assets/images/${convo['avatar']}.JPG'),
),

          title: Text(
            convo['name'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            convo['lastMessage'] as String,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                convo['time'] as String,
                style: const TextStyle(fontSize: 12),
              ),
              if ((convo['unreadCount'] as int) > 0)
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    convo['unreadCount'].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
