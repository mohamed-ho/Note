import 'package:flutter/material.dart';
import 'package:notes/features/Home/presentation/widgets/search_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          Text(
            'Notes',
            style: TextStyle(fontSize: 28),
          ),
          Spacer(),
          SearchIconButton()
        ],
      ),
    );
  }
}
