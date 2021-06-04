import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../extras/style/style.dart';


//textfield -- Simple text
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
        padding: EdgeInsets.fromLTRB(Platform.isWindows ? 0 : 17, 10, 15, 0),
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


//textfield -- Single chip
Widget ui_add_textfield_SingleSelectChip(BuildContext context, double textFieldwidth, double textFieldheight, TextEditingController _textf_contro_batmanvalue, List<String> chips_batmanvalue, String tempresult_batmanvalue){
  return new Column(
    children: [
      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: textFieldwidth,
            child : new Text("Batmankey",
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
        padding: EdgeInsets.fromLTRB(Platform.isWindows ? 0 : 17, 10, 15, 0),
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
            onTap: (){
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              FocusScope.of(context).requestFocus(new FocusNode());
              _show_batmanvalue_SelectionDialog(context, chips_batmanvalue, "batmanvalue", _textf_contro_batmanvalue, chips_batmanvalue, tempresult_batmanvalue);
            },

            style: TextStyle(color: colorStyle.textfield_text_color, fontSize: colorStyle.textfield_text_fontsize, letterSpacing: 2,fontFamily: '${colorStyle.textfield_text_font_family}'),

            decoration: InputDecoration(
              //prefixIcon: new Icon(FontAwesomeIcons.amazon, color: Colors.black26,),
              border: InputBorder.none,
              hintText: 'batmanvalue',
              hintStyle: new TextStyle(color: colorStyle.textfield_hint_text_color,fontFamily: '${colorStyle.textfield_text_font_family}',fontSize: colorStyle.textfield_hinttext_fontsize),
              contentPadding: EdgeInsets.fromLTRB(5, 10, 10, 10),
            ),


          ),
        ),
      ),
    ],
  );
}


//textfield -- datepicker
Widget ui_add_textfield_datepicker(BuildContext context, double textFieldwidth, double textFieldheight, TextEditingController _textf_contro_batmanvalue, String label, String hint){
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
        padding: EdgeInsets.fromLTRB(Platform.isWindows ? 0 : 17, 10, 15, 0),
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
            onTap: (){
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              FocusScope.of(context).requestFocus(new FocusNode());
              callDatePicker(context, _textf_contro_batmanvalue);
            },

            style: TextStyle(color: colorStyle.textfield_text_color, fontSize: colorStyle.textfield_text_fontsize, letterSpacing: 2,fontFamily: '${colorStyle.textfield_text_font_family}'),

            decoration: InputDecoration(
              //prefixIcon: new Icon(FontAwesomeIcons.amazon, color: Colors.black26,),
              border: InputBorder.none,
              hintText: 'batmankey',
              hintStyle: new TextStyle(color: colorStyle.textfield_hint_text_color,fontFamily: '${colorStyle.textfield_text_font_family}',fontSize: colorStyle.textfield_hinttext_fontsize),
              contentPadding: EdgeInsets.fromLTRB(5, 10, 10, 10),
            ),


          ),
        ),
      ),
    ],
  );
}


//textfield -- searchable dropdown
Widget ui_add_textfield_seachable_dd(BuildContext context, double textFieldwidth, double textFieldheight, List<DropdownMenuItem> items_batnamvalue, String selectedValue_batnamvalue, String label, String hint, Function after_function()){
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
        padding: EdgeInsets.fromLTRB(Platform.isWindows ? 0 : 17, 10, 15, 0),
        child: new Container(
          width: textFieldwidth,
          height: textFieldheight,
          padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(colorStyle.textfield_radius),),
            border: Border.all(color: colorStyle.textfield_border_color, width: 1.0, style: BorderStyle.solid),
            //color: colorStyle.textfield_bg_color,
          ),

          child : new SearchableDropdown(
            isExpanded: true,
            items: items_batnamvalue,
            value: selectedValue_batnamvalue,
            underline: Padding(
              padding: EdgeInsets.all(5),
            ),
            hint: new Text('batmankey', style: new TextStyle(color: colorStyle.textfield_hint_text_color,fontFamily: '${colorStyle.textfield_text_font_family}',fontSize: colorStyle.textfield_hinttext_fontsize),),
            searchHint: new Text('batmankey',
              style: TextStyle(color: colorStyle.tf_text_color, fontSize: colorStyle.tf_font_size2, letterSpacing: 2,fontFamily: '${colorStyle.universal_font_family}'),
            ),
            onChanged: (value) {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              FocusScope.of(context).requestFocus(new FocusNode());

                selectedValue_batnamvalue = value;
                after_function();

            },
          ),
        ),
      ),
    ],
  );
}



































//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//


/////////////////-----------------Single chip function----------------------//

_show_batmanvalue_SelectionDialog(BuildContext context, List<String> chips_list, String dbkey_noun, TextEditingController _textf_contro_batmanvalue, List<String> chips_batmanvalue, String tempresult_batmanvalue) {

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
              chips_list,

              onSelectionChanged: (selectedList) {
                //setState(() {

                  tempresult_batmanvalue = selectedList[0];
                  tempresult_batmanvalue = tempresult_batmanvalue.toLowerCase();

                  _textf_contro_batmanvalue.text =  tempresult_batmanvalue;

                //});

              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () async{
                  Navigator.of(context).pop();
                },
              )
            ],
          ),


        );
      });

}
/////////////////-----------------Single chip function----------------------//


/////////////////-----------------Single chip class--------------------//
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

/////////////////-----------------Single chip class--------------------//



//-------------test date picker---------------------------//
void callDatePicker(BuildContext context, TextEditingController textEditingController) async {
  var order = await getDate(context);

  var finaldate = order;
  textEditingController.text = finaldate.toString().substring(0, 10);


}

Future<DateTime> getDate(BuildContext context) {
  // Imagine that this function is
  // more complex and slow.
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime(2070),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.light(),
        child: child,
      );
    },
  );
}

//-------------test date picker---------------------------//


//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//
//Supportive functionsssssssssssssssssssssssss---------------------------------------------------------//