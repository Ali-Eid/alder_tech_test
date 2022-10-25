import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const ButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: onPressed == null
                  ? null
                  : MaterialStateProperty.all<Color>(Colors.orange),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r)))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_forward,
                color: onPressed == null ? Colors.orange : Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text,
                style: TextStyle(
                    color: onPressed == null ? Colors.orange : Colors.white,
                    fontSize: 20.sp),
              ),
            ],
          )),
    );
  }
}
