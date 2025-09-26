import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/scrreens/item_screen.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_application_1/todo_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoList extends StatelessWidget {
  final List<TodoModel> listTodoModel;
  final double imageSize;
  final double borderRadius;

  const TodoList({
    super.key,
    /*>>>*/ required this.listTodoModel,
    this.imageSize = 50.0,
    this.borderRadius = 10,
  });
  String getLocalizedStatus(BuildContext context, String? status) {
    switch (status?.toLowerCase()) {
      case "waiting":
        return S.of(context).Waiting;
      case "inprogress":
        return S.of(context).Inprogress;
      case "finished":
        return S.of(context).Finished;
      default:
        return status ?? "";
    }
  }

  Color getBackColor(BuildContext context, String? status) {
    switch (status?.toLowerCase()) {
      case "waiting":
        return Colors.green[100]!;
      case "inprogress":
        return Colors.orange[100]!;
      case "finished":
        return Colors.blue[100]!;
      default:
        return Colors.red[100]!;
    }
  }

  Color getStatusColor(BuildContext context, String? status) {
    switch (status?.toLowerCase()) {
      case "waiting":
        return Colors.green;
      case "inprogress":
        return Colors.orange;
      case "finished":
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

  String getLocalizedPriority(BuildContext context, String? priority) {
    switch (priority?.toLowerCase()) {
      case "high":
        return S.of(context).high;
      case "medium":
        return S.of(context).medium;
      case "low":
        return S.of(context).low;
      default:
        return priority ?? "";
    }
  }

  Color getPriorityColor(BuildContext context, String? priority) {
    switch (priority?.toLowerCase()) {
      case "high":
        return Colors.green;
      case "medium":
        return Colors.orange;
      case "low":
        return Colors.red;
      default:
        return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listTodoModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final TodoModel todo = listTodoModel[index];
        log(todo.image.toString());
        return Card(
          color: Theme.of(context).cardColor, // adapts to light/dark

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ListTile(
            //            leading: const Hero(tag: 'hero-rectangle', child: BoxWidget(size: Size(50.0, 50.0))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(todoModel: todo),
                ),
              );
            },
            leading: Hero(
              tag: 'taskImage_${todo.id}', // Unique tag for each item

              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: CachedNetworkImage(
                  imageUrl: todo.image ?? "", //<<<????///
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                      ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    todo.title ?? "",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                //   decoration: BoxDecoration(
                //     color: getBackColor(context, todo.status),
                //     borderRadius: BorderRadius.circular(15),

                //     //shape: BoxShape.rectangle,
                //   ),
                //   child: Text(
                //     getLocalizedStatus(context, todo.status),
                //     style: TextStyle(
                //       fontSize: 14.sp,
                //       color: getStatusColor(context, todo.status),
                //     ),
                //   ),
                // ),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.sp, color: textColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.flag,
                      size: 15.sp,
                      color: getPriorityColor(context, todo.priority),
                    ),
                    Text(
                      getLocalizedPriority(context, todo.priority),

                      style: TextStyle(
                        fontSize: 14.sp,
                        color: getPriorityColor(context, todo.priority),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    // Text(
                    //    todo.date ?? "",
                    //   style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    // ),
                  ],
                ),
              ],
            ),
            ////add one more text after subtitle/////????
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: getBackColor(context, todo.status),
                borderRadius: BorderRadius.circular(10.r),

                //shape: BoxShape.rectangle,
              ),
              child: Text(
                getLocalizedStatus(context, todo.status),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: getStatusColor(context, todo.status),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
