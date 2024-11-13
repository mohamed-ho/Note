import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/features/Home/presentation/widgets/search_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
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
