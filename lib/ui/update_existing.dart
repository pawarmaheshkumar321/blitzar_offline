import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../extras/style/style.dart';
import '../functions/common_db_fun.dart';


//-----------------------------------textfield pop up -----------------------------------//

openPopUp(String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun, TextEditingController _textFieldControllerPopUp){
  _displayDialog(context, table_name, primary_keyid, primary_keyid_value,dbkey,currentValue,dbkey_noun,_textFieldControllerPopUp);
  _textFieldControllerPopUp.text = "$currentValue";
}


_displayDialog(BuildContext context, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun, TextEditingController _textFieldControllerPopUp) async {
  return showDialog(
      context: context,
      builder: (context) {
        return


          Theme(
            data: ThemeData(hintColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0.0),
              child: AlertDialog(
                backgroundColor: Colors.white,
                title: Text('$dbkey_noun', style: new TextStyle(color: Colors.black,
                    fontFamily: colorStyle.universal_font_family,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.5),),
                content: TextField(
                  controller: _textFieldControllerPopUp,
                  decoration: InputDecoration(hintText: "$dbkey_noun", hintStyle: new TextStyle(color: Colors.black26), ),

                ),
                actions: <Widget>[

                  new FlatButton(
                    child: new Text('OK',style: new TextStyle(color: Colors.black87),),
                    onPressed: () async{
                      Navigator.of(context).pop();
                      _textFieldControllerPopUp.text = dtc.removeWhiteSpaceBandE(_textFieldControllerPopUp.text);
                      await updateData(table_name,primary_keyid, primary_keyid_value, dbkey,_textFieldControllerPopUp.text);

                      refresherBatmanDetails();

                    },
                  ),

                  new FlatButton(
                    child: new Text('CANCEL',style: new TextStyle(color: Colors.black87),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              ),
            ),
          );


      });
}

/// openPopUp
///////////////////////////////////////////////////////////////////////////////////////////////