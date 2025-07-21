import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../../../core/Widgets/Custom_Buttons.dart';

void showTransparentFilterDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Filter",
    barrierColor: Colors.black.withOpacity(0.7),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      String selectedValue = 'All';

      return Center(
        child: Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: Sizeresponsive.defaultSize! * 35,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filter by',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                      
                    ),
                    SizedBox(height: 22,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Delivered To',style: TextStyle(color: Colors.grey,fontSize: 20),),
                        SizedBox(width: 5,),
                        Icon(Icons.delivery_dining_sharp,color: Colors.grey,)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: selectedValue,
                          isExpanded: true,
                          icon: const SizedBox.shrink(),
                          items: ['All', 'Pending', 'Delivered', 'Cancelled'].map((status) {
                            return DropdownMenuItem<String>(
                              value: status,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(status),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                selectedValue = val;
                              });
                            }
                          },
                          selectedItemBuilder: (context) {
                            return ['All', 'Pending', 'Delivered', 'Cancelled'].map((status) {
                              return Row(
                                children: [
                                  Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey,),
                                  SizedBox(width: 5),
                                  Text(status),
                                ],
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                    heightSpace(value: 3),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundCheckBox(
                          onTap: (selected) {},
                          size: 35,
                          uncheckedColor: Colors.transparent,
                          borderColor: kMainColor,


                        ),
                        widthSpace(value: 1),
                        Text('Offers',style: TextStyle(color: Colors.grey,fontSize: 20),),
                      ],
                    ),
                    heightSpace(value: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundCheckBox(
                          onTap: (selected) {},
                          size: 35,
                          uncheckedColor: Colors.transparent,
                          borderColor: kMainColor,


                        ),
                        widthSpace(value: 1),
                        Text('Free Delivery',style: TextStyle(color: Colors.grey,fontSize: 20),),
                      ],
                    ),
                    heightSpace(value: 5),
                    Genral_Button(
                      text: 'Apply Filter',
                      ontap: () {


                      },
                    ),
                    heightSpace(value: 1),
                    TextButton(onPressed: (){ Navigator.of(context).pop();}, child: Text('Close',style: TextStyle(color: Colors.grey,fontSize: 20),))
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
