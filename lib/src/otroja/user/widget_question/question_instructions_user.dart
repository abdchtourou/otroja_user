import 'package:flutter/material.dart';

import 'enhanced_circular_indicator_user.dart';

class QuestionInstructionsUser extends StatelessWidget {
  const QuestionInstructionsUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            textDirection: TextDirection.rtl,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: ' ملاحظة:',
                  style: TextStyle(color: Color(0xFF85313C), fontSize: 20),
                ),
                TextSpan(
                  text:
                  ' اكتب نص السؤال واجاباته في الحقول بلاسفل واضغط على رقم الاجابة لتعيينها بأنها هي الإجابة الصحيحة',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        const EnhancedCircularIndicatorUser(),
      ],
    );
  }
}
