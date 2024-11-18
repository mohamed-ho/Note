import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty.png',
              width: .5.sw,
              height: .5.sw,
            ),
            Text(
              'there is no Notes ',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey.shade200),
            )
          ],
        ),
      ),
    );
  }
}
