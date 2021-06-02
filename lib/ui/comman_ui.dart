import 'package:flutter/material.dart';
import '../extras/style/style.dart';

void ui_showInSnackBar_new(BuildContext context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text(value, style: new TextStyle(fontFamily:'Gilroy',fontWeight:FontWeight.normal, color: colorStyle.snackbar_text_color, fontSize: colorStyle.snackbar_font_size),), backgroundColor: colorStyle.snackbar_bg,));
}