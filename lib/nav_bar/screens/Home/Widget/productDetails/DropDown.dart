import 'package:flutter/material.dart';

class SimpleMultiDropdown extends StatefulWidget {
  final String title;

  const SimpleMultiDropdown({super.key, required this.title});

  @override
  State<SimpleMultiDropdown> createState() => _SimpleMultiDropdownState();
}

class _SimpleMultiDropdownState extends State<SimpleMultiDropdown> {
  final Map<String, String> weightPrices = {
    '50 Gram': '4.00 KD',
    '1 Kg': '6.25 KD',
    '2 Kg': '12.00 KD',
  };

  List<String> selectedWeights = [];
  bool showDropdown = false;

  void toggleDropdown() {
    setState(() {
      showDropdown = !showDropdown;
    });
  }

  void toggleItem(String weight) {
    setState(() {
      if (selectedWeights.contains(weight)) {
        selectedWeights.remove(weight);
      } else {
        selectedWeights.add(weight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String display = selectedWeights.isEmpty
        ? widget.title
        : selectedWeights.map((e) => '$e - ${weightPrices[e]}').join(', ');

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: toggleDropdown,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    display,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  showDropdown
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
          if (showDropdown)
            Column(
              children: weightPrices.keys.map((weight) {
                bool isSelected = selectedWeights.contains(weight);
                return GestureDetector(
                  onTap: () => toggleItem(weight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: isSelected ? Colors.green : Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text('$weight - ${weightPrices[weight]}',style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
