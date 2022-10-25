import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialStrategyWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final GestureTapCallback textTap;
  final bool isPressed;
  const SpecialStrategyWidget(
      {super.key,
      required this.onTap,
      required this.isPressed,
      required this.textTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          child: InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: isPressed
                  ? const Icon(
                      Icons.check,
                      color: Colors.orange,
                    )
                  : const SizedBox(),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        RichText(
          text: TextSpan(
              text: 'اوافق على ',
              style: TextStyle(color: Colors.orange, fontSize: 14.sp),
              children: [
                TextSpan(
                    text: 'سياسة الخصوصية والشروط والاحكام',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = textTap),
              ]),
        ),
      ],
    );
  }
}
