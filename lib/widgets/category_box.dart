import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/themes/themes.dart';
import './custom_rect_tween.dart';

class CategoryBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final params = Parameters(454, 45454);
    // final _categoryList = ref.watch(getCategoriesProvider(params));

    return Hero(
      tag: '',
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin, end: end);
      },
      child: Container(
        height: 300,
        width: 300,
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: CustomColors.ecru,
          child: SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        '',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    Divider()
                  ],
                );
              },
              itemCount: 26,
            ),
          ),
        ),
      ),
    );
  }
}
