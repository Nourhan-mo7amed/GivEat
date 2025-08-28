import 'package:flutter/material.dart';

import '../widgets/searchBar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = <_ChatItem>[
      _ChatItem(
        title: 'Resala Charity',
        subtitle: 'Delivery will arrive in 30 mins.',
        timeAgo: '2 days ago.',
        avatar: const AssetImage('assets/images/r.png'),
      ),
      _ChatItem(
        title: 'Orman Association',
        subtitle: 'Delivery will arrive in 30 mins.',
        timeAgo: '2 days ago.',
        avatar: const AssetImage('assets/images/r.png'),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Search
              const SearchBarWidget(), const SizedBox(height: 20),
              // List
              Expanded(
                child: ListView.separated(
                  itemCount: chats.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = chats[index];
                    return Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundImage: item.avatar,
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          item.subtitle,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12.5,
                          ),
                        ),
                        trailing: Text(
                          item.timeAgo,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          // افتحي شاشة المحادثة الفعلية هنا لو عايزة
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatItem {
  final String title;
  final String subtitle;
  final String timeAgo;
  final ImageProvider avatar;

  _ChatItem({
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    required this.avatar,
  });
}
