import 'package:random_string/random_string.dart' as random;
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';


class common_db_functions{



  customQuery(String custom_query) async{
    print(custom_query);

    var createDoc = <String, String>{};
    createDoc['custom_query'] = custom_query;

    final loginData = await http.post(
      "$url_prefix/app/run_custom_query.php",
      body: createDoc,
    );

    print(loginData.body);

    Map<String, dynamic> map_custom_res_array = json.decode(loginData.body);


    return map_custom_res_array;

  }


  customQueryResponseArray(String table_name, String primary_keyid, String primary_keyid_value, String custom_query) async{
    print(custom_query);

    var createDoc = <String, String>{};
    createDoc['table_name'] = table_name;
    createDoc['primary_keyid'] = primary_keyid;
    createDoc['primary_keyid_value'] = primary_keyid_value;
    createDoc['custom_query'] = custom_query;

    final loginData = await http.post(
      "$url_prefix/app/run_custom_query_res.php",
      body: createDoc,
    );

    print(loginData.body);

    Map<String, dynamic> map_custom_res_array = json.decode(loginData.body);


    return map_custom_res_array;

  }



  customQueryMultiple(String custom_query, String custom_query2, String custom_query3, String custom_query4, String custom_query5, String custom_query6) async{
    print(custom_query);

    var createDoc = <String, String>{};
    createDoc['custom_query'] = custom_query;
    createDoc['custom_query2'] = custom_query2;
    createDoc['custom_query3'] = custom_query3;
    createDoc['custom_query4'] = custom_query4;
    createDoc['custom_query5'] = custom_query5;
    createDoc['custom_query6'] = custom_query6;

    final loginData = await http.post(
      "$url_prefix/app/run_multiple_custom_queries.php",
      body: createDoc,
    );

    print(loginData.body);

    Map<String, dynamic> map_custom_res_array = json.decode(loginData.body);


    return map_custom_res_array;

  }


  updateData(String table_name, String primary_keyid, String primary_keyid_value, String dbkey, String newvalue) async{

    var createDoc = <String, String>{};
    createDoc['table_name'] = table_name;
    createDoc['primary_keyid'] = primary_keyid;
    createDoc['primary_keyid_value'] = primary_keyid_value;
    createDoc['dbkey'] = dbkey;
    createDoc['value'] = newvalue;


    final loginData = await http.post(
      "$url_prefix/app/update_data.php",  // change with your API
      body: createDoc,
    );
    print(loginData.body);

    Map<String, dynamic> map_custom_res_array = json.decode(loginData.body);

    return map_custom_res_array;

  }


  addPrimaryKeyToData(String table_name, String primary_keyid, String primary_keyid_value) async{

    var createDoc = <String, String>{};
    createDoc['table_name'] = table_name;
    createDoc['primary_keyid'] = primary_keyid;
    createDoc['primary_keyid_value'] = primary_keyid_value;

    final loginData = await http.post(
      "$url_prefix/app/add_primary_key_table.php",  // change with your API
      body: createDoc,
    );
    print(loginData.body);

    Map<String, dynamic> map_custom_res_array = json.decode(loginData.body);

    return map_custom_res_array;

  }



}