import 'package:flutter/material.dart';
import '../extras/style/style.dart';




Widget ui_add_textfield(double textFieldwidth, double textFieldheight, TextEditingController _textf_contro_batmanvalue, String label, String hint){
  return new Column(
    children: [
      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: textFieldwidth,
            child : new Text("$label",
              style: TextStyle(
                fontSize: colorStyle.textfield_text_fontsize,
                fontWeight: colorStyle.textfield_text_fontweight,
                color: colorStyle.textfield_label_text_color,
                fontFamily: '${colorStyle.textfield_text_font_family}',
              ),),
          ),
        ],
      ),

      new Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
        child: new Container(
          width: textFieldwidth,
          height: textFieldheight,
          padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(colorStyle.textfield_radius),),
            border: Border.all(color: colorStyle.textfield_border_color, width: 1.0, style: BorderStyle.solid),
            //color: colorStyle.textfield_bg_color,
          ),

          child : new TextField(
            textAlign: TextAlign.start,
            controller: _textf_contro_batmanvalue,
            keyboardType: TextInputType.text,
            /*inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],*/
            style: TextStyle(color: colorStyle.textfield_text_color, fontSize: colorStyle.textfield_text_fontsize, letterSpacing: 2,fontFamily: '${colorStyle.textfield_text_font_family}'),

            decoration: InputDecoration(
              //prefixIcon: new Icon(FontAwesomeIcons.amazon,color: Colors.black26,),
              border: InputBorder.none,
              hintText: '$hint',
              hintStyle: new TextStyle(color: colorStyle.textfield_hint_text_color,fontFamily: '${colorStyle.textfield_text_font_family}',fontSize: colorStyle.textfield_hinttext_fontsize),
              contentPadding: EdgeInsets.fromLTRB(5, 10, 10, 10),
            ),


          ),
        ),
      ),
    ],
  );
}