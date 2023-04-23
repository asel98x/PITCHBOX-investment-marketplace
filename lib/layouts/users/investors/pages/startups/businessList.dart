import 'package:flutter/material.dart';
import 'package:pitchbox/backend/controller/IndustryController.dart';
import 'package:pitchbox/backend/controller/startupController.dart';
import 'package:pitchbox/backend/model/businessModel.dart';
import 'package:pitchbox/backend/model/industry.dart';
import 'package:pitchbox/layouts/users/Euntrepreneur/pages/businessList/updateEunBusinessList.dart';
import 'package:pitchbox/layouts/users/investors/pages/startups/list view.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appStyles.dart';

class BusinessListPage extends StatefulWidget {
  const BusinessListPage({Key? key}) : super(key: key);

  @override
  _BusinessListPageState createState() => _BusinessListPageState();
}

class _BusinessListPageState extends State<BusinessListPage> {
  final BusinessController _controller = BusinessController();
  final IndustryController _industryController = IndustryController();
  final TextEditingController _searchController = TextEditingController();

  List<Business> _businessList = [];
  List<Industry> _industryList = [];

  @override
  void initState() {
    super.initState();
    _loadBusinessList();
    _loadIndustryList();
  }

  Future<void> _loadBusinessList() async {
    List<Business> businessList = await _controller.getNewBusinessesListINT();
    setState(() {
      _businessList = businessList;
    });
  }
  Future<void> _loadIndustryList() async {
    List<Industry> industryList = await _industryController.getIndustries();
    setState(() {
      _industryList = industryList;
    });
  }

  void _filterBusinessList(String query) {
    List<Business> filterBusinessList = _businessList
        .where((business) =>
        business.businessName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _businessList = filterBusinessList;
    });
  }

  Future<void> _handleRefresh() async {
    _loadBusinessList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainBlueColor,
        title: Text('P I T C H B O X'),
      ),
      body: Column(
          children: [
            Container(
              color: AppColors.lightBlueColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Startup',
                    hintText: 'Enter a Startup name',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    _filterBusinessList(value);
                  },
                ),
              ),
            ),

            Container(
              color: AppColors.lightBlueColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _industryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Industry industry = _industryList[index];
                      return Container(
                        width: 100.0,
                        height: 10.0,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                industry.imgUrl,
                                height: 30,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    industry.name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Expanded(
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: _businessList.isEmpty
                    ? Center(
                  child: Text('No Startups found'),
                )
                    : ListView.builder(
                  itemCount: _businessList.length,
                  itemBuilder: (context, index) {
                    Business business = _businessList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => businessListView(business: _businessList[index],)),
                        );
                      },
                      onLongPress: () {

                      },
                      child: Card(
                        margin: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.network(
                                      business.businessImgUrl,
                                      fit: BoxFit.cover,
                                      height: 125.0,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            blurRadius: 8.0,
                                            spreadRadius: 4.0,
                                            offset: Offset(0.0, 4.0),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          business.UserImgUrl,
                                        ),
                                        radius: 28.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.0),
                                  Text(
                                    business.businessName,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 18.0,
                                      color: AppColors.blueDarkColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    business.executiveSummary,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.greyColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$'+business.fundAmount,
                                        style: ralewayStyle.copyWith(
                                          fontSize: 22.0,
                                          color: AppColors.blueDarkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Text 1',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        'Text 2',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        'Text 3',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]
      ),
    );
  }
}