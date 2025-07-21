import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../core/utilis/size_responsive.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: Sizeresponsive.defaultSize! * 2, right: Sizeresponsive.defaultSize! * 2, top: Sizeresponsive.defaultSize! * 1,bottom: Sizeresponsive.defaultSize! * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20,),
                child: Text(
                  'Select Delivery Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              heightSpace(value: 1),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add New Address',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.grey,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              heightSpace(value: 1.5),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(

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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 17, bottom: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            widthSpace(value: 1),
                            Text(
                              'Address 1',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Spacer(),
                            RoundCheckBox(
                              size: 30,
                              onTap: (selected) {},),
                          ],
                        ),
                          heightSpace(value: 1),
                        Text('Sherif Magdy',style: TextStyle( fontSize: 15),),

                        Text('+20 1090560210',style: TextStyle( fontSize: 15),),
                          heightSpace(value: 1),
                          Text('Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates',style: TextStyle( fontSize: 13,color: Colors.grey),),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
