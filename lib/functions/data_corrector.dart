//trim or trimmer
String bz_dtc_removeWhiteSpaceBandE(String input){
  input = input.trim();
  return input;
}

//****************************************************************************************************//

String bz_dtc_totalWhiteSpaceRemover(String input){
  try{
    if(input!=null || input!="NULL" || input!="null" || input!="Null"){
      input = input.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    }
    else{
      input = "";
    }
  }
  catch(e){
    input = "";
  }

  return input;
}

//****************************************************************************************************//

String bz_dtc_nullCorrector(String input, String ifNullData){
  try{
    if(input==null || input=="NULL" || input=="null" || input=="Null"){
      input = ifNullData;
    }
  }
  catch(e){
    input = ifNullData;
  }

  return input.toString();
}

//****************************************************************************************************//

String bz_dtc_dateCorrector(String input){
  try{
    input = input.trim();
    input = input.replaceAll("/", "-");

  }catch(e){
    return input;
  }
  return input;
}

//****************************************************************************************************//

String bz_dtc_roundOffandInt(String input){
  try{
    input = input.trim();
    input = double.parse(input).round().toString();
    input = int.parse(input).toString();
  }catch(e){
    return input;
  }
  return input;
}

//****************************************************************************************************//

String bz_dtc_specialCharacterRemover(String input,String replacement){
  try{
    if(input!=null || input!="NULL" || input!="null" || input!="Null"){

      input = input.replaceAll(new RegExp(r"[^a-zA-Z0-9/]"), replacement);
      input = input.replaceAll(".",replacement);
      //input = input.replaceAll(new RegExp(r"[^\s\w]"),"");
    }
    else{
      input = "";
    }
  }
  catch(e){
    input = "";
  }

  return input;
}

//****************************************************************************************************//

String bz_dtc_newlineRemover(String input){
  try{
    if(input!=null || input!="NULL" || input!="null" || input!="Null"){
      input = input.replaceAll(new RegExp(r"\n"), "");
    }
    else{
      input = "";
    }
  }
  catch(e){
    input = "";
  }

  return input;
}

//****************************************************************************************************//

String bz_dtc_multiWhiteSpaceRemover(String input){
  try{
    if(input!=null || input!="NULL" || input!="null" || input!="Null"){
      input = input.replaceAll(new RegExp(r"    "), " ");
      input = input.replaceAll(new RegExp(r"   "), " ");
      input = input.replaceAll(new RegExp(r"  "), " ");
    }
    else{
      input = "";
    }
  }
  catch(e){
    input = "";
  }

  return input;
}

//****************************************************************************************************//