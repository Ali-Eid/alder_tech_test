import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting Page Demo',
        style: TextStyle(color: Colors.orange, fontSize: 20.sp),
      ),
    );
  }
}
