
import 'package:flutter/material.dart';


import '../../../../Resources/assets_manager.dart';
import '../../../../Resources/color_manager.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        
        filled: true,
        fillColor: ColorManager.whiteColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search Product',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 114, 112, 112)),
        suffixIconConstraints: BoxConstraints(maxWidth: 75),
        suffixIcon: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // added line
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: ImageIcon(
                AssetImage(Iconss.mic),
                size: 20,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: ImageIcon(
                AssetImage(Iconss.camera),
                size: 20,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: ColorManager.whiteColor)),
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
      ),
    ));
  }
}
