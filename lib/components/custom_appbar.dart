import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 17, 113, 209), 
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white), 
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
