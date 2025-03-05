import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';

class ExpandedOverviewCard extends StatefulWidget {
  final bool isExpanded;
  final bool isSelected;
  final String title;
  final List<Map<String, String>>? options;
  final Color color;
  final Function() onSelect;

  const ExpandedOverviewCard({
    super.key,
    required this.isExpanded,
    required this.isSelected,
    required this.title,
    this.options,
    this.color = AppColors.white,
    required this.onSelect,
  });

  @override
  State<ExpandedOverviewCard> createState() => _ExpandedOverviewCardState();
}

class _ExpandedOverviewCardState extends State<ExpandedOverviewCard> {
  bool _extendCard = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onSelect,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color:
                  widget.isSelected ? AppColors.secondaryColor : widget.color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected
                      ? AppColors.primaryColor
                      : Color(0xFF526366),
                ),
                if (widget.isExpanded && widget.options != null)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _extendCard = !_extendCard;
                      });
                    },
                    child: Icon(
                      _extendCard
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                      color: _extendCard
                          ? AppColors.primaryColor
                          : Color(0xFF526366),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (_extendCard && widget.options != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.options!.length, (index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(widget.options![index]["route"]!);
                },
                child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CustomText(
                    text: widget.options![index]["title"]!,
                    fontSize: 14.sp,
                    color: Color(0xFF526366),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }),
          ),
      ],
    );
  }
}
