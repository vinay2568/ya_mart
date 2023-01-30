import 'package:flutter/material.dart';


class InputTextField extends StatefulWidget {
   InputTextField({
    required this.suffix,
    required this.hinttext,
    Key? key,
  }) : super(key: key);
String hinttext;
IconData  suffix;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
   String dropdownvalue = 'SKU ID';

   // List of items in our dropdown menu
   var items = [
     'SKU ID',
     '2',
     '3',
     '4',
     '5',
   ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
          BoxShadow(
          offset:  Offset(1, 2),
        blurRadius: 0.2,
        spreadRadius: 0.3,
        color: Colors.grey
    ),
      ]),
      child: Row(
        children: [
          DropdownButton(

            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: widget.hinttext,
                  hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: Icon(widget.suffix,color: Colors.black,size: 25,),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
