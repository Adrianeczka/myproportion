import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../models/proposed_product.dart';

final getProposedProductProvider =
    FutureProvider.family<ProposedProductList, int>((ref, productId) async {
  var authToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjI0ODY1NTcsImV4cCI6MTY0NTI3Mjk1NywiaXNzIjoiVGhlUHJvcG9ydGlvbiIsImlkIjoxLCJ1c2VybmFtZSI6ImhhYnJ6eWsiLCJmaXJzdG5hbWUiOiJrYW1pbGVrIiwic3VybmFtZSI6ImhhYiIsImVtYWlsIjoia2FtaWwuaGFicnp5a0BnbWFpbC5jb20iLCJtZW50b3JJZCI6MzMyLCJleHBpcnlEYXRlIjp7ImRhdGUiOiIyMjIxLTA0LTA1IDAwOjAwOjAwLjAwMDAwMCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiRXVyb3BlXC9QYXJpcyJ9LCJyZWN1cnJpbmciOm51bGwsImludGVydmFsIjo0LCJyb2xlcyI6WyJST0xFX1NVUEVSX0FETUlOIiwiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJhY2NlcHRVc2VyRHVtbXkiOm51bGwsInByaXZhY3lQb2xpY3kiOnRydWUsImNyZWF0aW9uRGF0ZSI6eyJkYXRlIjoiMjAyMS0wMy0yNyAxMDozMTo0MC4wMDAwMDAiLCJ0aW1lem9uZV90eXBlIjozLCJ0aW1lem9uZSI6IkV1cm9wZVwvUGFyaXMifSwicmV0dXJuRGF0ZSI6eyJkYXRlIjoiMjAxOS0wOS0yNSAxNjoxNjoyMC4wMDAwMDAiLCJ0aW1lem9uZV90eXBlIjozLCJ0aW1lem9uZSI6IkV1cm9wZVwvUGFyaXMifSwic3RhcnRQcm9tb3Rpb25EYXRlIjp7ImRhdGUiOiIyMDIxLTAzLTI0IDAwOjAwOjAwLjAwMDAwMCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiRXVyb3BlXC9QYXJpcyJ9LCJlbmFibGVTZWFzb25Gb3JjZSI6dHJ1ZSwiaXNTdWJzY3JpcHRpb25FeHRlbmQiOmZhbHNlfQ.HlfOxDz5YW62--A2afP9NwcHzCCG9rfLAAMyseA806b_zgH2Fk3M8MfTzrkrj2rW_yXhDTGX-AY_zs2Q-HIai_dZfrdCYbbt8d280OvMRda_821Mwh85Jwi4wcg0hK0DVTRrMJVATyrXCCLiWACQl3TyVfEcAbICSEPGOkETAIuibnDEJx_qW74zwPMHSLY3qsYzhJQSXdCydWfFWCWFnx64v584CGSq4OU__CiSC6TuogLBoKuHOqcal4jlQjhCiUgPF5eQyjYbiEshcAZV7ugQDH5bT3t8N1DyrU9Exbp-lvIHzBtjbHJbiFiAcj4_iLRK5pa9OP4XkJduMknBOP5Z4QVajkyG7mbjtyhHwxE7WhqmtXa5-US_zIKI06Jhp2xwq-cC9v-tzfj07WeNXeElrQgvRfGX0hSu8SxLCxyHms9QygKjqeKdCkqExhRFiq02X-cZABGdoc_67Zqp20mZdJUZWuyCZ3wqcv43P_odXl8N5RqljumwxipMFeMA3OIaY32WpiKfDPzxXn5y8ImNpl8D4hB96bo3AJ-BQCNBelkBa228V8ZC7ligHXmMjtvJ54AQiGPze9FzNWgMz4Dx7ehIVx9DLf8e951-Dq6n7sFQKCM1vz3LB-L7-K3UPnzRSPbfofWlT77pXEnEKnNigKVMyBz5pT5GPLRMeEM';
  final response = await http.get(
    Uri.parse(
        'https://api.myproportion.com/api/v1/proposed-products/$productId/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $authToken',
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> proposedProductList = jsonDecode(response.body);
    return ProposedProductList.fromJson(proposedProductList);
  } else if (response.statusCode == 204) {
    return ProposedProductList();
  } else {
    throw HttpException('List of product\'s cannot be rendered');
  }
});
