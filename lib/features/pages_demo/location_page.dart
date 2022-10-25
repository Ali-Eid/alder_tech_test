import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Location Page Demo',
        style: TextStyle(color: Colors.orange, fontSize: 20.sp),
      ),
    );
  }
}
