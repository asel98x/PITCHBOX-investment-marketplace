import 'package:flutter/material.dart';
import 'package:pitchbox/backend/controller/businessController.dart';
import 'package:pitchbox/backend/model/business.dart';

class BusinessListPage extends StatefulWidget {
  // late Business business;
  // BusinessListPage({required this.business});

  @override
  _BusinessListPageState createState() => _BusinessListPageState();
}

class _BusinessListPageState extends State<BusinessListPage> {
  final BusinessController _controller = BusinessController();

  List<Business> _businessList = [];

  @override
  void initState() {
    super.initState();
    _loadBusinessList();
  }

  Future<void> _loadBusinessList() async {
    List<Business> businessList = await _controller.getNewBusinesses();
    setState(() {
      _businessList = businessList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Businesses'),
      ),
      body: _businessList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _businessList.length,
        itemBuilder: (context, index) {
          Business business = _businessList[index];
          return Card(
            child: ListTile(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessListPage(business: business,),));
              },
              title: Text(business.businessIndustry),
              subtitle: Text(business.businessName),
            ),
          );
        },
      ),
    );
  }
}
