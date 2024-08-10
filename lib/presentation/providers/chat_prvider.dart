import 'package:flutter/material.dart';
import 'package:yes_no_maybe_chat/config/helpers/yes_no_answer.dart';
import 'package:yes_no_maybe_chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'hola, ya estas en casa?', fromWho: FromWho.me),
  ];
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      othersReply();
    }

    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> othersReply() async {
    final othersMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(othersMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
