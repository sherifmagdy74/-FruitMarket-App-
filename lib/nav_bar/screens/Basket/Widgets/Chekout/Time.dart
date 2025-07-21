import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/Custom_Buttons.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../core/Widgets/space_widget.dart';
import 'date.dart';
class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  DateTime? selectedDate;

  // تنسيق التاريخ بالشكل المطلوب (MM - dd - yyyy)
  String get formattedDate {
    if (selectedDate == null) return 'Select Date';
    return DateFormat('MM - dd - yyyy').format(selectedDate!);
  }

  Future<void> _pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
      
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
      body:
      SingleChildScrollView(
        child: Column(
        
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
              child: Container(
                height: 55,
                width: double.infinity,
        
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
        
                  color: Colors.white,
                  borderRadius:  BorderRadius.circular(20),
                ),
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text('Now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      RoundCheckBox(
                        size: 30,
                        onTap: (selected) {},),
                  ],),
                ),
        
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 15),            child: Container(
        
                width: double.infinity,
        
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
        
                  color: Colors.white,
                  borderRadius:  BorderRadius.circular(20),
                ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 15),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Delivery Time',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    RoundCheckBox(
                      size: 30,
                      onTap: (selected) {},),
                  ],
                ),
                heightSpace(value: 1.5),
                Text('Select Date',style: TextStyle(color: Colors.grey,fontSize: 17),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(fontSize: 20, color: kMainColor, fontWeight: FontWeight.bold),
                    ),
                    IconButton  (icon:Icon(Icons.arrow_drop_down, color: Colors.grey) , onPressed: _pickDate,),
                  ],
                ),
                Divider(color: Colors.grey.shade300,),
        
              ],
            ),
          ),
              ),
            )
          ],
        ),
      )
      ,
    ) ;
  }
}
