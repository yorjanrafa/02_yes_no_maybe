import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget {
  const FieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textControll = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
      // outline border
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      fillColor: Colors.black12,
      suffixIcon: IconButton(
          icon: const Icon(FluentIcons.send_16_regular),
          onPressed: () {
            final textValue = textControll.value.text;
            print('value: $textValue');
            textControll.clear();
          }),
    );
    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('summited: $value');
        textControll.clear();
        focusNode.requestFocus();
      },
    );
  }
}
