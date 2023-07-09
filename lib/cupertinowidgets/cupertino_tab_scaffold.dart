import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabScaffoldWidget extends StatelessWidget {
  CupertinoTabScaffoldWidget({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    const ChatTab(), // see the HomeTab class below
    const MailTab() // see the SettingsTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUPERTINO TAB SCAFFOLD WIDGET'),
      ),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: CupertinoColors.activeOrange,
          inactiveColor: CupertinoColors.inactiveGray,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.mail,
              ),
              label: 'Mail',
            ),
          ],
        ),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) {
            return _tabs[index];

            // return Center(
            //   child: index == 0 ? Text("Chat tab"): Text("Mail Tab"),
            // );
          },
        ),
      ),
    );
  }
}

// Home Tab
class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Tab'),
    );
  }
}

// Settings Tab
class MailTab extends StatelessWidget {
  const MailTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Mail Tab'),
    );
  }
}
