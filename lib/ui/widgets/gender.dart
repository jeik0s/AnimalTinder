import 'package:flutter/material.dart';


Widget genderWidget(icon, text, size, selected, onTap){
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: <Widget>[
        Icon(icon,
        size: size.height * 0.11,
        color: selected == text ? Colors.white : Colors.black,),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          text,
          style: TextStyle(
            color: selected == text ? Colors.white : Colors.black
          ),
        )
      ],
    ),
  );
}