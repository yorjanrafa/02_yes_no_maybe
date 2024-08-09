import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

Image imageFile = Image.asset('assets/image.jpg');

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leadingWidth: 70,
        leading: const Row(
          children: [
            Icon(Icons.arrow_back, size: 25),
            Padding(
                padding: EdgeInsets.all(0.0),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('lib/assets/images/avatars/s/avatar1.png'),
                  maxRadius: 20,
                ))
          ],
        ),

        actions: const [
          Icon(FluentIcons.video_16_regular, size: 25),
          SizedBox(width: 15),
          Icon(
            FluentIcons.call_12_regular,
            size: 25,
          ),
          SizedBox(width: 15),
          Icon(FluentIcons.more_vertical_16_filled, size: 25),
          SizedBox(
            width: 5,
          ),
        ],
        // create button to change theme

        titleTextStyle: TextStyle(
          fontSize: 16,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),

        title: const Text('My life 💖'),
      ),
    );
  }
}
