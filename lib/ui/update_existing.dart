import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../extras/style/style.dart';
import '../functions/common_db_fun.dart';
import '../extras/datacv/data_corrector.dart';
import '../extras/datacv/data_validator.dart';

//U2)-----------------------------------textfield pop up -----------------------------------//
openPopUp(BuildContext context,String url_prefix, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun, TextEditingController _textFieldControllerPopUp){
  _displayDialog(context, url_prefix, table_name, primary_keyid, primary_keyid_value,dbkey,currentValue,dbkey_noun,_textFieldControllerPopUp);
  _textFieldControllerPopUp.text = "$currentValue";
}


_displayDialog(BuildContext context, String url_prefix, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun, TextEditingController _textFieldControllerPopUp) async {
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
                      _textFieldControllerPopUp.text = bz_dtc_removeWhiteSpaceBandE(_textFieldControllerPopUp.text);
                      await updateData(url_prefix, table_name,primary_keyid, primary_keyid_value, dbkey,_textFieldControllerPopUp.text);

                      //refresherBatmanDetails();

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



//U3)--------------------------------chips SelectionDialog----------------------//
_show_SelectionDialog_batman(BuildContext context, String url_prefix, List<String> chips_batman, String tempresult_chips_batman, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        //Here we will build the content of the dialog
        return new Theme(
          data: new ThemeData(
            primaryColor: Colors.blue,
            primaryColorDark: Colors.black,
            hintColor: Colors.lightBlueAccent.withOpacity(0.1),
            backgroundColor: Colors.blue,
          ),

          child : AlertDialog(
            title: Text("Select $dbkey_noun", style: new TextStyle(color: Colors.black,
                fontFamily: colorStyle.universal_font_family,
                fontWeight: FontWeight.w600,
                fontSize: 17.5),),
            backgroundColor: Colors.white,
            content: SingleSelectChip(
              chips_batman,

              onSelectionChanged: (selectedList) {
                //setState(() {
                  tempresult_chips_batman = selectedList[0];
                  tempresult_chips_batman = tempresult_chips_batman.toLowerCase();

                //});

              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () async{
                  Navigator.of(context).pop();

                  await updateData(url_prefix, table_name, primary_keyid,primary_keyid_value, dbkey, tempresult_chips_batman);
                  //await refresherBatmanDetails();

                },
              )
            ],
          ),


        );
      });

}
//--------------------------------chips----------------------//



//U3)--------------------------------------Date picker dates--------------------------------------------//
//------------- date picker---------------------------//
void callDatePicker(BuildContext context, String url_prefix, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun, int start_year, int end_year) async {
  var order = await getDate(context, start_year, end_year);

  var finaldate = order;
  updateData(url_prefix, table_name,primary_keyid, primary_keyid_value, dbkey, finaldate.toString().substring(0,10));

  //refresherBatmanDetails();

}
//--------------------------------------Date picker dates--------------------------------------------//





//U5)-----------------------------------searchable dd transactions -----------------------------------//
//searchable dd transactions batman
_displayDialog_searchdd_batman(BuildContext context, String url_prefix, double textFieldwidthGlobal, double textFieldheightGlobal, List<DropdownMenuItem> items_batman, String selectedValue_batman_dd, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun) async {
  return showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: ThemeData(
              hintColor: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 0.0),
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Select $dbkey_noun', style: new TextStyle(color: Colors.black,
                  fontFamily: colorStyle.universal_font_family,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.5),),
              content: new Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: new Container(
                  width: textFieldwidthGlobal,
                  height: textFieldheightGlobal,
                  padding: EdgeInsets.fromLTRB(17, 5, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(colorStyle.tf_radius),),
                    border: Border.all(color: colorStyle.tf_border_color,width: 1.0,style: BorderStyle.solid),
                    color: Colors.white,
                  ),

                  child : SearchableDropdown(
                    isExpanded: true,
                    items: items_batman,
                    value: selectedValue_batman_dd,
                    hint: new Text('Select $dbkey_noun',style: new TextStyle(color: colorStyle.tf_text_color, fontSize: colorStyle.tf_font_size2-3, letterSpacing: 2,fontFamily: '${colorStyle.universal_font_family}'),),
                    searchHint: new Text('Select $dbkey_noun',
                      style: TextStyle(color: colorStyle.tf_text_color, fontSize: colorStyle.tf_font_size2-3, letterSpacing: 2,fontFamily: '${colorStyle.universal_font_family}'),
                    ),
                    onChanged: (value) {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      FocusScope.of(context).requestFocus(new FocusNode());

                      selectedValue_batman_dd = value;



                    },
                  ),
                ),
              ),



              actions: <Widget>[

                new FlatButton(
                  child: new Text('OK',style: new TextStyle(color: Colors.black87),),
                  onPressed: () async{
                    Navigator.of(context).pop();


                    await updateData(url_prefix, table_name, primary_keyid, primary_keyid_value, dbkey, selectedValue_batman_dd);
                    //refresherBatmanDetails();


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

//-----------------------------------searchable dd transactions -----------------------------------//





//U6)-----------------------------------Multiple chips transactions -----------------------------------//


/////////////////-----------------Multiple chips selection dialog----------------------//

_show_batmanvalue_SelectionDialog(BuildContext context, List<String> chips_batman, List<String> chips_selected_batman, String url_prefix, List<String> chips_list, String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String currentValue, String dbkey_noun) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        //Here we will build the content of the dialog
        return new Theme(
          data: new ThemeData(
            primaryColor: Colors.blue,
            primaryColorDark: Colors.black,
            hintColor: Colors.lightBlueAccent.withOpacity(0.1),
            backgroundColor: Colors.blue,
          ),

          child : AlertDialog(
            title: Text("batman",style: new TextStyle(color: colorStyle.new_token_MultiSelectChip_title_text_color),),
            backgroundColor: Colors.white,
            content: MultiSelectChip(
              chips_batman,

              onSelectionChanged: (selectedList) {
                //setState(() {

                chips_selected_batman = selectedList;

                //});

              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                //onPressed: () => Navigator.of(context).pop(),
                onPressed: () {

                  print("$chips_batman");
                  Navigator.of(context).pop();
                },
              )
            ],
          ),


        );
      });

}
//--------------------------------Multiple chips selection dialog----------------------//














//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//

//------------- date picker---------------------------//
Future<DateTime> getDate(BuildContext context, int start_year, int end_year) {
  // Imagine that this function is
  // more complex and slow.
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(start_year),
    lastDate: DateTime(end_year),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.light(),
        child: child,
      );
    },
  );
}
//------------- date picker---------------------------//


//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//






//Supportive Classssssssssssssssssssssssssssss---------------------------------------------------------//
//Supportive Classssssssssssssssssssssssssssss---------------------------------------------------------//
//Supportive Classssssssssssssssssssssssssssss---------------------------------------------------------//


/////////////////-----------------chips--multiple class--------------------//
class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);

              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }



  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}


/////////////////-----------------chips--multiple class--------------------//
///////////////////////////////////////////////////////////////////////////////////////////////


/////////////////-----------------chips--single class--------------------//
class SingleSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  SingleSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _SingleSelectChipState createState() => _SingleSelectChipState();
}

class _SingleSelectChipState extends State<SingleSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              /*selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);*/

              selectedChoices.contains(item) ?
              selectedChoices.clear() : selectedChoices.clear();

              selectedChoices.contains(item)
                  ? print("present")
                  : selectedChoices.add(item);


              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

/////////////////-----------------chips--single class--------------------//


//Supportive Classssssssssssssssssssssssssssss---------------------------------------------------------//
//Supportive Classssssssssssssssssssssssssssss---------------------------------------------------------//
//Supportive Classssssssssssssssssssssssssssss---------------------------------------------------------//