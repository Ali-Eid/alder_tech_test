import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo1Page extends StatelessWidget {
  const Demo1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Demo 1 Page ',
        style: TextStyle(color: Colors.orange, fontSize: 20.sp),
      ),
    );
  }
}
