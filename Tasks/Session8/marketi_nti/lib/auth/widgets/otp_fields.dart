import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFields extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;

  const OtpFields({
    super.key,
    required this.length,
    required this.onCompleted,
  });

  @override
  State<OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.length,
      (_) => TextEditingController(),
    );
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  String getCode() =>
      controllers.map((e) => e.text).join().replaceAll(' ', '');

  void checkComplete() {
    final code = getCode();

    if (code.length == widget.length && !code.contains(' ')) {
      widget.onCompleted(code);
    }
  }

  void moveNext(int index) {
    if (index < widget.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  void movePrev(int index) {
    if (index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 50.w,
          height: 60.h,
          child: TextFormField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,

            // 🔥 مهم: يمنع الحروف
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],

            style: TextStyle(fontSize: 18.sp),

            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: Color(0xFFB2CCFF),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            ),

            onChanged: (value) {
              if (value.isNotEmpty) {
                controllers[index].text = value; // ضمان رقم واحد فقط
                moveNext(index);
              } else {
                movePrev(index);
              }

              checkComplete();
            },
          ),
        );
      }),
    );
  }
}