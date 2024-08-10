import 'package:flutter/material.dart';
import 'package:yes_no_maybe_chat/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  // add getter for message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text,
                style: TextStyle(
                    color: colors.onSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
