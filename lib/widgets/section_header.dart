import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String action;

  const SectionHeader(
      {Key? key, required this.title, this.action = 'veiw more'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.crimsonPro(
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 13.sp),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            action,
            style: GoogleFonts.crimsonPro(
              textStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 10.sp),
            ),
          ),
        ),
      ],
    );
  }
}
