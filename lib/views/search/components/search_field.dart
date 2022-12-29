import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';
import '../../../view_models/search_view_model.dart';
import '../result_search_screen.dart';

class SearchField extends StatelessWidget {
  final bool readOnly;
  final void Function() onTap;
  const SearchField({super.key, required this.readOnly, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 40,
        child: Consumer<SearchProductViewModel>(
          builder: (context, search, _) => TextField(
            onTap: onTap,
            readOnly: readOnly,
            onChanged: (value) {
              search.changeinput(value);
              search.searchProduct();
            },
            controller: search.searchController,
            onSubmitted: (_) {
              search.addRecentSearch();
              Navigator.of(context).pushReplacement(
                NavigatorFadeTransitionHelper(
                  child: const ResultSearchScreen(),
                ),
              );
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  search.addRecentSearch();
                  search.searchProduct();
                  Navigator.of(context).pushReplacement(
                    NavigatorFadeTransitionHelper(
                      child: const ResultSearchScreen(),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.search, color: Colors.black87),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 5, right: 20),
              hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              hintText: "Search Product Name",
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
