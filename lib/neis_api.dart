import 'dart:convert';
import 'api_key.dart';
import 'package:http/http.dart' as http;

class NeisApi {
  final String key = api_key;
  final String ATPT_OFCDC_SC_CODE = 'J10';
  final String SD_SCHUL_CODE = '7551253';

  getMeal({required String MLSV_FROM_YMD, required String MLSV_TO_YMD}) async {
    String site =
        'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=$key&Type=json&ATPT_OFCDC_SC_CODE=$ATPT_OFCDC_SC_CODE&SD_SCHUL_CODE=$SD_SCHUL_CODE&MLSV_FROM_YMD=$MLSV_FROM_YMD&MLSV_TO_YMD=$MLSV_TO_YMD';
    //https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=$key&Type=json&ATPT_OFCDC_SC_CODE=$ATPT_OFCDC_SC_CODE&SD_SCHUL_CODE=$SD_SCHUL_CODE&MLSV_FROM_YMD=$MLSV_FROM_YMD&MLSV_TO_YMD=$MLSV_TO_YMD
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var meals = jsonDecode(response.body)['mealServiceDietInfo'][1]['row']
          as List<dynamic>;
      return meals;
    }
  }
}
