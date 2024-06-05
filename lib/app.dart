
import 'package:contactlist_app/ui/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';

class ContactListTodoApp extends StatelessWidget {
  const ContactListTodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF667C89),
            foregroundColor: Colors.white,
            centerTitle: true
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.symmetric(vertical: 18),
            backgroundColor:const  Color(0xFF667C89),
            foregroundColor: Colors.white,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
          ),
        ),

        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),

          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),

          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),

        ),
      ),
      home: const ContactListScreen(),
    );
  }
}
