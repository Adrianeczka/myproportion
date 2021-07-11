import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/http_exception.dart';
import '../models/proposed_product.dart';
import '../widgets/exchange_box.dart';

final getProductByNameProvider =
    FutureProvider.family<ProposedProductList, int>((ref, productDay) async {
  final searchedProduct = ref.watch(searchProductProvider).state;
  var authToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjUwNDgwMzksImV4cCI6MTY0NzgzNDQzOSwiaXNzIjoiVGhlUHJvcG9ydGlvbiIsImlkIjoxNTIwMCwidXNlcm5hbWUiOiJuaWNvaiIsImZpcnN0bmFtZSI6Ik1pa29cdTAxNDJhaiIsInN1cm5hbWUiOiJKYW5vd3NraSIsImVtYWlsIjoibWphbm93c2tpMTVAd3AucGwiLCJtZW50b3JJZCI6bnVsbCwiZXhwaXJ5RGF0ZSI6eyJkYXRlIjoiMjAyMS0wNy0yOSAwMDowMDowMC4wMDAwMDAiLCJ0aW1lem9uZV90eXBlIjozLCJ0aW1lem9uZSI6IkV1cm9wZVwvUGFyaXMifSwicmVjdXJyaW5nIjpmYWxzZSwiaW50ZXJ2YWwiOjEsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJhY2NlcHRVc2VyRHVtbXkiOm51bGwsInByaXZhY3lQb2xpY3kiOnRydWUsImNyZWF0aW9uRGF0ZSI6eyJkYXRlIjoiMjAyMS0wNi0yOCAxOTozNTo0Ny4wMDAwMDAiLCJ0aW1lem9uZV90eXBlIjozLCJ0aW1lem9uZSI6IkV1cm9wZVwvUGFyaXMifSwicmV0dXJuRGF0ZSI6eyJkYXRlIjoiMjAyMS0wNi0yOCAxOTozNTo1Mi4wMDAwMDAiLCJ0aW1lem9uZV90eXBlIjozLCJ0aW1lem9uZSI6IkV1cm9wZVwvUGFyaXMifSwic3RhcnRQcm9tb3Rpb25EYXRlIjp7ImRhdGUiOiIyMDIxLTA2LTI5IDAwOjAwOjAwLjAwMDAwMCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiRXVyb3BlXC9QYXJpcyJ9LCJlbmFibGVTZWFzb25Gb3JjZSI6bnVsbCwiaXNTdWJzY3JpcHRpb25FeHRlbmQiOmZhbHNlfQ.NAfF3HyaE41iy15RdZZAzDBmh9xwte7_XAVmyhNdOkWUbpbvJYaoxBTUn2Owpqa0tVuqbCm-mrhg7AFIc9a4fbhjDx_n_LsXVKKOQ7waEpm3r8jELXg2i0AKGdMOMY3m2b25MDSosGcTcPrWSts36v1bzLOcs1LaTuJkYj7O4KUcgMLecT7WHZRmtd071uSSAmUGTbkfKZkZMca2pom1Qn1-_Xi8SyspEq0uOUWTXKX2CdcIF6k7VB_GqUmbpFNm8uzYQIzjwzUE_ktLFnapWxMTwKFGbtBFwcq-BrxQ_jsujz5ILE2i5OYE7QtRhhBxDjpZrKYe0qkCPmL2g6_Vn9Jryt_Ml-_tRwlEl_XmaZJoo3wKpl_1qaOkdMXFiazCg4E_2GUA7YJ1vCa4NyzZLACZDFHSJfKZ_LaPnAEkHP3Fmp_zJJLhfbJCE8yxUP_8IOzIUA4uKKdFn6ToOQLyWW9FAItH383h7uUZnpvlfg9PzLMcfYM3qBCIX4QvPQWVqRtl1ruZGR-3HhuWojAPR_NL44TGO6fPKJ0QwEvdRigKqB67E7scvpZDapcF59WatcK5zNpudMfG2HkJOTLytuLCkUwvXYRret6tJZ8NbO3wAXyhv8TZ8y7ACQAGMM87xxUXqAOqMeWr_6mnlwzBlZqgoPRlfeYgPeQL_wPss3U';
  final response = await http.post(
    Uri.parse(
        'https://api.myproportion.com/api/v1/products-diet-day-by-search/$productDay'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $authToken',
    },
    body: jsonEncode(
        <String, String>{'language': 'pl', 'search': searchedProduct!}),
  );
  if (response.statusCode == 200) {
    List<dynamic> proposedProductList = jsonDecode(response.body);
    return ProposedProductList.fromJson(proposedProductList);
  } else if (response.statusCode == 204) {
    return ProposedProductList();
  } else {
    throw HttpException('get product to exchange is impossible2.');
  }
});
