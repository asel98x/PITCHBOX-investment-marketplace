import 'package:flutter/material.dart';

import 'stepper/CheckoutForm.dart';

class EunBusinessList extends StatefulWidget {
  const EunBusinessList({Key? key}) : super(key: key);

  @override
  State<EunBusinessList> createState() => _EunBusinessListState();
}

class _EunBusinessListState extends State<EunBusinessList> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Business List'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    onPressed: () => _searchController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 20, // replace with actual user data length
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('User $index'),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CheckoutForm()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

}
