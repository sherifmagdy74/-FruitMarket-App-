import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateExample extends StatefulWidget {
  @override
  _SelectDateExampleState createState() => _SelectDateExampleState();
}

class _SelectDateExampleState extends State<SelectDateExample> {
  DateTime? selectedDate;

  String get formattedDate {
    if (selectedDate == null) return 'Select Date';
    return DateFormat('MM - dd - yyyy').format(selectedDate!);
  }


  Future<void> _pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Icon(Icons.calendar_today, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
