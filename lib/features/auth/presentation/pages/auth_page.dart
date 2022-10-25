import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_alder_tech/features/auth/presentation/pages/policy_page.dart';
import 'package:test_alder_tech/features/auth/presentation/widgets/button_widet.dart';
import 'package:test_alder_tech/features/auth/presentation/widgets/special_strategy_widget.dart';
import 'package:test_alder_tech/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:test_alder_tech/home/home_page.dart';
import 'package:test_alder_tech/injection_container.dart' as di;

import '../bloc/auth/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffe5f9ef),
      body: BlocProvider(
        create: (context) => di.sl<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SuccessAuthState) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'انشاء حساب',
                  style: TextStyle(color: Colors.orange, fontSize: 20.sp),
                ),
                const TextFieldWidget(
                    text: 'الاسم الكامل',
                    icon: Icons.person_outline_outlined,
                    keyboardType: TextInputType.text,
                    isSecure: false),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: TextFieldWidget(
                          text: 'رقم الهاتف',
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          isSecure: false),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Container(
                          height: 60.h,
                          width: 30.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white),
                          child: const Text('09'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                const TextFieldWidget(
                  text: 'كلمة المرور',
                  icon: Icons.lock,
                  keyboardType: TextInputType.text,
                  isSecure: true,
                ),
                SizedBox(
                  height: 15.h,
                ),
                const TextFieldWidget(
                  text: 'تأكيد كلمة المرور',
                  icon: Icons.lock,
                  keyboardType: TextInputType.text,
                  isSecure: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SpecialStrategyWidget(
                  onTap: () {
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  isPressed: isPressed,
                  textTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PolicyPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                const ButtonWidget(onPressed: null, text: 'انشاء حساب'),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is LoadingAuthState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      );
                    }
                    return ButtonWidget(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(LoginGuestEvent());
                        },
                        text: 'الدخول كضيف');
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Divider(
                  endIndent: 30,
                  indent: 30,
                ),
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(color: Colors.orange, fontSize: 20.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
