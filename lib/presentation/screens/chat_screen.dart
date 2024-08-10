import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_chat/domain/entities/message.dart';
import 'package:yes_no_maybe_chat/presentation/providers/chat_prvider.dart';
import 'package:yes_no_maybe_chat/presentation/widgets/chat/chat_my_buble.dart';
import 'package:yes_no_maybe_chat/presentation/widgets/chat/chat_others_bubble.dart';
import 'package:yes_no_maybe_chat/presentation/widgets/shared/box_field.dart';

Image imageFile = Image.asset('assets/image.jpg');

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leadingWidth: 75,
        leading: const Row(
          children: [
            SizedBox(width: 5),
            Icon(FluentIcons.arrow_left_16_regular, size: 25),
            SizedBox(width: 5),
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
          Icon(FluentIcons.camera_16_regular, size: 29),
          SizedBox(width: 15),
          Icon(
            FluentIcons.call_16_regular,
            size: 27,
          ),
          SizedBox(width: 15),
          Icon(FluentIcons.more_vertical_16_filled, size: 29),
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
      body: _Chatview(),
    );
  }
}

class _Chatview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messagesList[index];
                return (message.fromWho == FromWho.me)
                    ? MyMessageBubble(message: message)
                    : OthersMessageBubble(message: message);
              },
            )),
            // caja de texto
            FieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
