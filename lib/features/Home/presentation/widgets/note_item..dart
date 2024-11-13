import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key, this.fontFamily, this.noteBackground});
  String? fontFamily;
  Color? noteBackground;
  String x = 'this is sub title content this is sub title content this is';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      height: .2.sh,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: noteBackground ?? Colors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'this is title',
              style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'this is sub title content this is sub title content this is',
              style: TextStyle(fontFamily: fontFamily, fontSize: 16.sp),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  size: 30.w,
                )),
          ),
          Text(
            '1/3/2014',
            style: TextStyle(fontFamily: fontFamily),
          ),
        ],
      ),
    );
  }
}
