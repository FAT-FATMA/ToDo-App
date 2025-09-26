import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildInfoCard(BuildContext context, String label, String value, {Widget? trailing}) {

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      //color: Colors.grey[200],
      //shape: BoxShape.rectangle,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey[100]!,
      //     blurRadius: 10,
      //     offset: const Offset(0, 2),
      //   ),
      // ],
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.grey[200]!),
    ),

    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  //color: titleColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,                  
                ),
              ),
               SizedBox(height: 4.h),
              Text(
                value,
                                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //color: titleColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,                  
                ),
              ),
            ],
          ),
        ),
        if (trailing != null) trailing,
      ],
    ),
  );
}
