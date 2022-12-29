import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/utils.dart';
import '../../../view_models/search_view_model.dart';
import '../result_search_screen.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Terakhir Dicari",
                style: TextStyle(fontSize: 16),
              ),
              _deleteIndexSearch(),
            ],
          ),
          const SizedBox(height: 16),
          _listRecentSearch(),
        ],
      ),
    );
  }

  Widget _listRecentSearch() {
    return Consumer<SearchProductViewModel>(
      builder: (context, search, _) => ListView.builder(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:
            search.recentSearch.length < 8 ? search.recentSearch.length : 8,
        itemBuilder: (context, index) {
          final data = search.recentSearch[index];

          return SizedBox(
            height: 35,
            child: InkWell(
              onTap: () async {
                search.searchProductByTap(data);
                search.searchController.text = data;
                Navigator.of(context).pushReplacement(
                  NavigatorFadeTransitionHelper(
                    child: const ResultSearchScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.history,
                          size: 20, color: Colors.grey.shade500),
                      const SizedBox(width: 8),
                      Text(
                        data,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      search.removeRecentSearchByIndex(index);
                    },
                    child: Icon(Icons.close,
                        size: 20, color: Colors.grey.shade500),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _deleteIndexSearch() {
    return Consumer<SearchProductViewModel>(
      builder: (context, search, _) => InkWell(
        onTap: () {
          search.removeRecentSearch();
        },
        child: const Text(
          "Hapus Semua",
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }
}
