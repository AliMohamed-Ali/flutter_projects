import 'package:flutter/material.dart';

class SearchTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<SearchTabViewModel>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          // Implement the search input and button
          // For example, a search field and a search button
          TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: 'Search',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Search'),
          ),
          // Implement the results as a list or a grid view
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                // Implement the UI for each search result here
                return ListTile(
                  title: Text("test"),
                  onTap: () {
                    // Open web view with movie or series details
                    // Implement navigation to web view here
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
