import 'package:flutter/material.dart';

class TrackingSteps extends StatelessWidget {
  const TrackingSteps({super.key});

  final List<Map<String, String>> steps = const [
    {
      "title": "Delivered",
      "subtitle": "Estimated for 10 September, 2021"
    },
    {
      "title": "Out for delivery",
      "subtitle": "Estimated for 10 September, 2021"
    },
    {
      "title": "Order shipped",
      "subtitle": "Estimated for 10 September, 2021"
    },
    {
      "title": "Confirmed",
      "subtitle": "Your order has been confirmed"
    },
    {
      "title": "Order Placed",
      "subtitle": "We have received your order"
    },
  ];

  final int currentStep = 2;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final double dotSize = isPortrait ? 18 : 16;
    final double lineHeight = isPortrait ? 40 : 35;
    final double titleFontSize = isPortrait ? 16 : 14;
    final double subtitleFontSize = isPortrait ? 14 : 12;
    final double spacingBetweenDotAndText = isPortrait ? 13 : 8;
    final double bottomSpacing = isPortrait ? 15 : 12;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(steps.length, (index) {
        bool isUpcoming = index <= currentStep;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: isUpcoming ? Colors.white : Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
                if (index != steps.length - 1)
                  Container(
                    width: 2,
                    height: lineHeight,
                    color: Colors.green,
                  ),
              ],
            ),
            SizedBox(width: spacingBetweenDotAndText),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    steps[index]['title']!,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    steps[index]['subtitle']!,
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: bottomSpacing),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
