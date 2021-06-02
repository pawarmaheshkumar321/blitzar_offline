import 'data_corrector.dart';



//only numbers(Numeric) - no special character
bool bz_dtv_isNumericOnlyNoSpl(String input){
  input = bz_dtc_removeWhiteSpaceBandE(input);
  return(input.contains(new RegExp(r'^[0-9]+$')));
}

//****************************************************************************************************//

//only numbers and character(AlphaNumeric) - no special character
bool bz_dtv_isAlphaNumericOnlyNoSpl(String input){
  input = bz_dtc_removeWhiteSpaceBandE(input);
  return(input.contains(new RegExp(r'^[a-zA-Z0-9]+$')));
}

//****************************************************************************************************//

//only characters(Alphabet) - no special character
bool bz_dtv_isAlphaOnlyNoSpl(String input){
  input = bz_dtc_removeWhiteSpaceBandE(input);
  return(input.contains(new RegExp(r'^[a-zA-Z]+$')));
}

//****************************************************************************************************//

//only characters(Alphabet) - no special character
bool bz_dtv_isAlphaOnlyNoSplAllowWS(String input){
  input = bz_dtc_removeWhiteSpaceBandE(input);
  input = bz_dtc_totalWhiteSpaceRemover(input);
  return(input.contains(new RegExp(r'^[a-zA-Z]+$')));
}

//****************************************************************************************************//

//Date Validator(YYYY-MMM-DD)
bool bz_dtv_isDateOnlyNoSpl(String input){
  bool returna = false;
  input = bz_dtc_totalWhiteSpaceRemover(input);
  if(input.substring(0,4).contains(new RegExp(r'^[0-9]+$')) && input.substring(5,8).contains(new RegExp(r'^[a-zA-Z]+$')) && input.substring(9,11).contains(new RegExp(r'^[0-9]+$'))   ){

    if(input.substring(5,8).toLowerCase()=="jan" || input.substring(5,8).toLowerCase()=="feb" || input.substring(5,8).toLowerCase()=="mar" || input.substring(5,8).toLowerCase()=="apr" || input.substring(5,8).toLowerCase()=="may" || input.substring(5,8).toLowerCase()=="jun" || input.substring(5,8).toLowerCase()=="jul" || input.substring(5,8).toLowerCase()=="aug" || input.substring(5,8).toLowerCase()=="sep" || input.substring(5,8).toLowerCase()=="oct" || input.substring(5,8).toLowerCase()=="nov" || input.substring(5,8).toLowerCase()=="dec"  ){

      try{


        if(input.substring(5,8).toLowerCase()=="jan" || input.substring(5,8).toLowerCase()=="mar" || input.substring(5,8).toLowerCase()=="may" || input.substring(5,8).toLowerCase()=="jul" || input.substring(5,8).toLowerCase()=="aug" || input.substring(5,8).toLowerCase()=="oct" || input.substring(5,8).toLowerCase()=="dec"){
          if(input.length==11 && int.parse(input.substring(9,11))<32 && bz_dtv_isNumericOnlyNoSpl(input.substring(9,11))){
            returna = true;
          }
          else{
            returna = false;
          }
        }

        if(input.substring(5,8).toLowerCase()=="feb" || input.substring(5,8).toLowerCase()=="apr" || input.substring(5,8).toLowerCase()=="jun" || input.substring(5,8).toLowerCase()=="sep" || input.substring(5,8).toLowerCase()=="nov" ){
          if(input.length==11 && int.parse(input.substring(9,11))<31 && bz_dtv_isNumericOnlyNoSpl(input.substring(9,11))){
            returna = true;
          }
          else{
            returna = false;
          }
        }



      }
      catch(e){
        returna = false;
      }

    }
  }
  return returna;
}

//****************************************************************************************************//

//Date Validator(DD-MM-YYYY)
//dd-mm-yyyy
bool bz_dtv_isNumDateOnly(String input){
  bool returna = false;
  input = bz_dtc_totalWhiteSpaceRemover(input);
  if(input.substring(6,10).contains(new RegExp(r'^[0-9]+$')) && input.substring(3,5).contains(new RegExp(r'^[0-9]+$')) && input.substring(0,2).contains(new RegExp(r'^[0-9]+$'))   ){

    if(int.parse(input.substring(3,5))<13){

      try{

        if(input.substring(3,5).toLowerCase()=="01" || input.substring(3,5).toLowerCase()=="03" || input.substring(3,5).toLowerCase()=="05" || input.substring(3,5).toLowerCase()=="07" || input.substring(3,5).toLowerCase()=="08" || input.substring(3,5).toLowerCase()=="10" || input.substring(3,5).toLowerCase()=="12"){
          if(input.length==10 && int.parse(input.substring(0,2))<32 && bz_dtv_isNumericOnlyNoSpl(input.substring(0,2))){
            returna = true;
          }
          else{
            returna = false;
          }
        }

        if(input.substring(3,5).toLowerCase()=="02" || input.substring(3,5).toLowerCase()=="04" || input.substring(3,5).toLowerCase()=="06" || input.substring(3,5).toLowerCase()=="09" || input.substring(3,5).toLowerCase()=="11" ){
          if(input.length==10 && int.parse(input.substring(0,2))<31 && bz_dtv_isNumericOnlyNoSpl(input.substring(0,2))){
            returna = true;
          }
          else{
            returna = false;
          }
        }



      }
      catch(e){

        returna = false;
      }

    }
  }
  return returna;
}

//****************************************************************************************************//