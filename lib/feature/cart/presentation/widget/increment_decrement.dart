import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/constant/font_size/custom_text_style.dart';

class IncrementDecrement extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const IncrementDecrement({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.shade200),
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            onTap: onDecrement,
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: count > 1 ? Colors.pink.shade400 : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Icon(
                MdiIcons.minus,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),

          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Padding(
              key: ValueKey<int>(count),
              padding:  EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                  count.toString(),
                  style: CustomTextStyles.bodyLarge
              ),
            ),
          ),

          InkWell(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            onTap: onIncrement,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: count < 10 ? Colors.pink.shade400 : Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Icon(
                MdiIcons.plus,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
