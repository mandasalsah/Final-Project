import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';
import '../../../view_models/search_view_model.dart';
import '../result_search_screen.dart';

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<SearchProductViewModel>(
            builder: (context, search, _) => const Text(
              "Saran Pencarian",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          _listRecentSearch(context),
        ],
      ),
    );
  }

  Widget _listRecentSearch(BuildContext context) {
    return Consumer<SearchProductViewModel>(
      builder: (context, search, _) {
        if (search.appState == AppState.failure) {
          return const Center(
            child: Text(
              "Failed get data from server",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        }
        if (search.appState == AppState.noData) {
          return Center(
            child: Column(
              children: [
                const Text("There Are No Suitable Product",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Text("Please try using other keywords to find the product name",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    textAlign: TextAlign.center),
              ],
            ),
          );
        }

        if (search.appState == AppState.loaded) {
          return ListView.builder(
            reverse: true,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                search.searchResult.length < 8 ? search.searchResult.length : 8,
            itemBuilder: (context, index) {
              final data = search.searchResult[index];
              return SizedBox(
                height: 35,
                child: InkWell(
                  onTap: () {
                    search.searchProductByTap(data.name);
                    search.searchController.text = data.name;
                    Navigator.of(context).pushReplacement(
                      NavigatorFadeTransitionHelper(
                        child: const ResultSearchScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.history,
                          size: 20, color: Colors.grey.shade500),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.77,
                        child: Text(
                          data.name,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
