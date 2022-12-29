import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../view_models/search_view_model.dart';
import 'components/search_components.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<SearchProductViewModel>(context, listen: false)
          .saveRecentSearch(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();

    return GestureDetector(
      onTap: () {
        focusField.unfocus();
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          ),
          title: const Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          elevation: 0.3,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<SearchProductViewModel>(
            builder: (context, search, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                SearchField(readOnly: false, onTap: () {}),
                const SizedBox(height: 32),
                search.input.isEmpty
                    ? const RecentSearch()
                    : const SearchSuggestion(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
