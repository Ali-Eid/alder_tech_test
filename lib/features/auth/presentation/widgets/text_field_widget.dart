import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isSecure;
  const TextFieldWidget(
      {super.key,
      required this.text,
      required this.icon,
      required this.keyboardType,
      required this.isSecure});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 2,
      // padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        // inputFormatters: [
        //   LengthLimitingTextInputFormatter(8),
        // ],
        // maxLength: 10,
        maxLength: keyboardType == TextInputType.phone ? 8 : null,
        keyboardType: keyboardType,
        cursorColor: Colors.orange,
        obscureText: isSecure,
        decoration: InputDecoration(
          contentPadding: keyboardType == TextInputType.phone
              ? EdgeInsets.symmetric(vertical: 0, horizontal: 10.w)
              : null,
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(
                10.r,
              )),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(
                10.r,
              )),
          border: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
        ),
      ),
    );
  }
}
