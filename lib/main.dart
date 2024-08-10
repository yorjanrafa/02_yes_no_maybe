import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_chat/config/theme/app_theme.dart';
import 'package:yes_no_maybe_chat/presentation/providers/chat_prvider.dart';
import 'package:yes_no_maybe_chat/presentation/screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0, isDarkMode: false).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
