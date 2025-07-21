import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';

class tff extends StatelessWidget {
  const tff({super.key, required this.title, required this.hintText});
final String title;
final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        heightSpace(value: 0.8),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(

              hintText: hintText,
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}

















class PhoneTFF extends StatefulWidget {
  const PhoneTFF({super.key, required this.title, required this.hintText});
  final String title;
  final String hintText;

  @override
  State<PhoneTFF> createState() => _PhoneTFFState();
}

class _PhoneTFFState extends State<PhoneTFF> {
  String selectedCode = '+20';
  final List<String> countryCodes = ['+20', '+966', '+971', '+1','+44'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        heightSpace(value: 0.8),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              DropdownButton<String>(
                dropdownColor: Colors.white,
                borderRadius:  BorderRadius.circular(80),
                menuWidth: 75,
                value: selectedCode,
                underline: SizedBox(),
                items: countryCodes.map((code) {
                  return DropdownMenuItem(
                    value: code,
                    child: Text(code),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCode = value;
                    });
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: VerticalDivider(color: Colors.grey[400],),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
