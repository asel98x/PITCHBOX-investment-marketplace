import 'package:flutter/material.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/businessList/stepper/businessListCheckoutForm.dart';
import 'package:pitchbox/styles/appColors.dart';

import 'stepper/CheckoutForm.dart';

class EunBusinessList extends StatefulWidget {
  const EunBusinessList({Key? key}) : super(key: key);


  @override
  State<EunBusinessList> createState() => _EunBusinessListState();
}

class _EunBusinessListState extends State<EunBusinessList> {
  final List<Map<String, String>> data = [
    {
      'name': 'John Doe',
      'location': 'New York, NY'
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles, CA'
    },
    {
      'name': 'Bob Johnson',
      'location': 'Chicago, IL'
    },
    {
      'name': 'John Doe',
      'location': 'New York, NY'
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles, CA'
    },
    {
      'name': 'Bob Johnson',
      'location': 'Chicago, IL'
    },
    {
      'name': 'John Doe',
      'location': 'New York, NY'
    },
    {
      'name': 'Jane Smith',
      'location': 'Los Angeles, CA'
    },
    {
      'name': 'Bob Johnson',
      'location': 'Chicago, IL'
    }

    // Add as many items as you need
  ];
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Business List'),
          backgroundColor: AppColors.mainBlueColor,
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
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final name = data[index]['name'];
                  final location = data[index]['location'];

                  return Card(
                    child: ListTile(
                      title: Text(name!),
                      subtitle: Text(location!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => BusinessListCheckoutForm()));
          },
          child: Icon(Icons.add),
            backgroundColor: AppColors.mainBlueColor,
        ),
      ),
    );
  }

}
