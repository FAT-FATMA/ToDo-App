import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_application_1/theme/theme_constans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textfield extends StatefulWidget {
  final String textFieldHint;
  final bool isObsecures;
  final TextEditingController controller;
  final int maxLines;
  final String? textBeforeTextFormFiled;
  final bool showCountryCode;
  final bool showPasswordToggle;
  final TextInputType? textInputType;

  const Textfield({
    super.key,
    required this.textFieldHint,
    this.isObsecures = false,
    required this.controller,
    this.maxLines = 1,
    this.textBeforeTextFormFiled,
    this.showCountryCode = false,
    this.showPasswordToggle = false,
    this.textInputType = TextInputType.text,
  });

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObsecures;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.textBeforeTextFormFiled != null)
          Text(
            widget.textBeforeTextFormFiled ?? "",
            style: TextStyle(fontSize: 15.sp, color: textColor),
          ),
        TextField(
          obscureText: _obscureText,
          maxLines: widget.maxLines,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.textFieldHint,
            hintStyle: const TextStyle(color: textColor),
            fillColor: primaryColor,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),

            prefixIcon: widget.showCountryCode
                ? CountryCodePicker(
                    onChanged: (country) {},
                    initialSelection: 'EG',
                    favorite: ['+20', 'EG'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                  )
                : null,

            suffixIcon: widget.showPasswordToggle
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
