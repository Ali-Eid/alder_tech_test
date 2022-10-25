import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_alder_tech/injection_container.dart' as di;
import '../bloc/policy/policy_bloc.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocProvider(
            create: (context) => di.sl<PolicyBloc>()..add(GetPolicyEvent()),
            child: BlocBuilder<PolicyBloc, PolicyState>(
              builder: (context, state) {
                if (state is LoadedPolicyState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Text(
                            'Policy',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.orange),
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Text(state.policy),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is LoadingPolicyState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
                return const SizedBox();
              },
            )),
      ),
    );
  }
}
