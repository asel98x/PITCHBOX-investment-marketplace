import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';
import 'package:pitchbox/backend/controller/startupController.dart';
import 'package:pitchbox/backend/controller/userInvestmentController.dart';
import 'package:pitchbox/backend/model/businessModel.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appIcons.dart';
import 'package:pitchbox/styles/appStyles.dart';
import 'package:url_launcher/url_launcher.dart';

import 'payment/payhere_payment.dart';

class businessListView extends StatefulWidget {
  Business business;

  businessListView({required this.business, Key? key}) : super(key: key);

  @override
  _businessListViewState createState() => _businessListViewState();
}

class _businessListViewState extends State<businessListView> {
  final _formKey = GlobalKey<FormState>();
  String? paymentStatus;

  final BusinessController _Bcontroller = BusinessController();
  final userInvesmentController _investmentController = userInvesmentController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _investAmountController = TextEditingController();

  double sum = 0;

  String _userId = '';
  String _name = '';
  String _mobile = '';
  String _city = '';
  String _country = '';
  List<String> _professionalExperience = [];
  List<String> _entrepreneurshipExperience = [];
  List<String> _education = [];
  List<String> _industryCertifications = [];
  List<String> _awardsAchievements = [];
  List<String> _trackRecord = [];
  String _email = '';
  String _linkedin = '';
  String _twitter = '';
  String _facebook = '';
  String _instagram = '';
  String _Userwebsite = '';
  String _userImageDownloadUrl = '';

  String _businessId = '';
  String _businessName = '';
  String _businessLocation = '';
  String _businessIndustry = '';
  String _executiveSummary = '';
  String _companyDescription = '';
  String _businessModel = '';
  String _valueProposition = '';
  String _productOrServiceOffering = '';
  String _fundingNeeds = '';
  String _website = '';
  String  _investmentStage = '';
  String  _businessImageDownloadUrl = '';
  List<String> _industries = [];

  String _minimumInvestmentAmount = '';
  String _maximumInvestmentAmount = '';
  String _fundAmount = '';
  String _availableFundAmount = '';
  String _fundPurpose = '';
  String _timeline = '';
  String _fundingSources = '';
  String _investmentTerms = '';
  String _investorBenefits = '';
  String _riskFactors = '';
  String _investorLocation = '';
  String _status = '';

  File? _imageFile;
  File? _imageFile2;

  @override
  void initState() {
    super.initState();
    paymentStatus = "Not Paid";
    _userId = widget.business.userId;
    _name = widget.business.name;
    _mobile = widget.business.mobile;
    _city = widget.business.city;
    _country = widget.business.country;
    _professionalExperience =
        List<String>.from(widget.business.professionalExperience);
    _entrepreneurshipExperience =
        List<String>.from(widget.business.entrepreneurshipExperience);
    _education = List<String>.from(widget.business.education);
    _industryCertifications =
        List<String>.from(widget.business.industryCertifications);
    _industryCertifications =
        List<String>.from(widget.business.industryCertifications);
    _awardsAchievements = List<String>.from(widget.business.awardsAchievements);
    _trackRecord = List<String>.from(widget.business.trackRecord);
    _industries = List<String>.from(widget.business.industryFocus);
    _email = widget.business.email;
    _userImageDownloadUrl = widget.business.UserImgUrl;

    _businessId = widget.business.id;
    _businessName = widget.business.businessName;
    _businessIndustry = widget.business.businessIndustry;
    _businessLocation = widget.business.businessLocation;
    _executiveSummary = widget.business.executiveSummary;
    _companyDescription = widget.business.companyDescription;
    _businessModel = widget.business.businessModel;
    _valueProposition = widget.business.valueProposition;
    _investmentStage = widget.business.investmentStage;
    _productOrServiceOffering = widget.business.productOrServiceOffering;
    _fundingNeeds = widget.business.fundingNeeds;
    _website = widget.business.website;
    _businessImageDownloadUrl = widget.business.businessImgUrl;

    _minimumInvestmentAmount = widget.business.minimumInvestmentAmount;
    _maximumInvestmentAmount = widget.business.maximumInvestmentAmount;
    _fundAmount = widget.business.fundAmount;
    _availableFundAmount = widget.business.avaiableFundAmount;
    _investorLocation = widget.business.investorLocation;
    _fundPurpose = widget.business.fundPurpose;
    _timeline = widget.business.timeline;
    _fundingSources = widget.business.fundingSources;
    _investmentTerms = widget.business.investmentTerms;
    _investorBenefits = widget.business.investorBenefits;
    _riskFactors = widget.business.riskFactors;
    _status = widget.business.status;
  }

  payNow(Map<String, dynamic> paymentObjectOneTime) {
    PayHere.startPayment(paymentObjectOneTime, (paymentId) {
      debugPrint("One Time Payment Success. Payment Id: $paymentId");
      setPaymentStatus("Successful");
    }, (error) {
      debugPrint("One Time Payment Failed. Error: $error");
      setPaymentStatus("Failed");
    }, () {
      debugPrint("One Time Payment Dismissed");
      setPaymentStatus("Dismissed");
    });
  }


  void setPaymentStatus(String status) {
    setState(() {
      paymentStatus = status;
      debugPrint(status);
    });
  }

  void _addInvestmentValues() async {

  }

  void _showAddPaymentDetailsDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        bool _obscureText = true;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: AlertDialog(
                title: const Text('Payment Details'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'FullName',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ("Name cannot be Empty");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid name(Min. 3 Character)");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _nameController.text = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _addressController.text = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _investAmountController,
                        decoration: InputDecoration(
                          labelText: 'Invest Amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter invest amount';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _investAmountController.text = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reserved of : \$' + _fundAmount,
                            textAlign: TextAlign.justify,
                            style: ralewayStyle.copyWith(
                              fontSize: 14.0,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Minimum Investment Amount : \$' + _minimumInvestmentAmount,
                            textAlign: TextAlign.justify,
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Maximum Investment Amount : \$' + _maximumInvestmentAmount,
                            textAlign: TextAlign.justify,
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var payment = PayHerePayment(
                          orderId: "ItemNo12345",
                          items: "One Time Payment",
                          amount: _investAmountController.text,
                          firstName: _nameController.text,
                          lastName: "lastName",
                          email: "email@gmail.com",
                          phone: "0767777777",
                          address: _addressController.text,
                          city: "Kurunegala",
                          country: "Sri Lanka",
                          deliveryAddress: "No. 46, Galle road, Kalutara South",
                          deliveryCity: "Kalutara",
                          deliveryCountry: "Sri Lanka",
                          custom1: "",
                          custom2: "",
                        );
                        payNow(payment.paymentObjectOneTime);

                        double sum = 0;
                        String investment = _investAmountController.text;

                        String avaiableFundAmount = _fundAmount;
                        double availableFundAmountDouble = double.parse(avaiableFundAmount);
                        double investmentAmountDouble = double.parse(investment);
                        sum = availableFundAmountDouble + investmentAmountDouble;
                        String availableFundAmountString = sum.toString();
                        print(sum);

                        try {
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          final User? user = auth.currentUser;
                          String Id = user?.uid ?? '';
                           _investmentController.addUserInvestment(
                              investmentId: '',
                              userId: Id,
                              businessId: _businessId,
                               businessName: _businessName,
                              investedAmount: _investAmountController.text);
                          Navigator.of(context).pop();

                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to Invest'),
                            ),
                          );
                          print(e.toString());
                        }

                        try {
                          _Bcontroller.updateNewBusiness(
                              id: _businessId,
                              userId: _userId,
                              name: _name,
                              mobile: _mobile,
                              city: _city,
                              country: _country,
                              professionalExperience: _professionalExperience,
                              entrepreneurshipExperience: _entrepreneurshipExperience,
                              education: _education,
                              industryCertifications: _industryCertifications,
                              awardsAchievements: _awardsAchievements,
                              trackRecord: _trackRecord,
                              email: _email,
                              linkedin: _linkedin,
                              twitter: _twitter,
                              facebook: _facebook,
                              instagram: _instagram,
                              Userwebsite: _Userwebsite,
                              UserImgUrl: _imageFile,


                              businessName: _businessName,
                              businessIndustry: _businessIndustry,
                              businessLocation: _businessLocation,
                              executiveSummary: _executiveSummary,
                              companyDescription: _companyDescription,
                              businessModel: _businessModel,
                              valueProposition: _valueProposition,
                              productOrServiceOffering: _productOrServiceOffering,
                              fundingNeeds: _fundingNeeds,
                              website: _website,
                              businessImgUrl: _imageFile2,

                              fundAmount: _fundAmount,
                              avaiableFundAmount: availableFundAmountString,
                              fundPurpose: _fundPurpose,
                              timeline: _timeline,
                              fundingSources: _fundingSources,
                              investmentTerms: _investmentTerms,
                              investorBenefits: _investorBenefits,
                              riskFactors: _riskFactors,

                              minimumInvestmentAmount: _minimumInvestmentAmount,
                              maximumInvestmentAmount: _maximumInvestmentAmount,
                              investmentStage: _investmentStage,
                              industryFocus: _industries,
                              investorLocation: _investorLocation,
                              status: _status,
                              street: '',
                              state: '',
                              zipCode: '',
                              industry: '',
                              provider: '',
                              pass: '',
                              investmentGoal: '',
                              investmentCriteria: '',
                              image: null,
                              userImageDownloadUrl: _userImageDownloadUrl,
                              businessImageDownloadUrl: _businessImageDownloadUrl);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Error'),
                            ),

                          );
                          print(e.toString());
                        }
                      }
                    },
                    child: const Text('pay'),
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showEunDetailsDialog(BuildContext context, Business business) {
    GlobalKey _imageKey = GlobalKey();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Entrepreneur Information'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            (widget.business.UserImgUrl),
                          ))),
                ),
                SizedBox(height: 8),
                Text(
                  _name,
                  style: ralewayStyle.copyWith(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile : ' + _mobile,
                        textAlign: TextAlign.justify,
                        style: ralewayStyle.copyWith(
                          fontSize: 16.0,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'City : ' + _city,
                        textAlign: TextAlign.justify,
                        style: ralewayStyle.copyWith(
                          fontSize: 16.0,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Country  : ' + _country,
                        textAlign: TextAlign.justify,
                        style: ralewayStyle.copyWith(
                          fontSize: 16.0,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Email  : ' + _email,
                        textAlign: TextAlign.justify,
                        style: ralewayStyle.copyWith(
                          fontSize: 16.0,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Professional Experience',
                        textAlign: TextAlign.start,
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 8),
                      Column(
                        children: _professionalExperience
                            .map(
                              (experience) => Column(
                                children: [
                                  Text(
                                    '• ' + experience,
                                    textAlign: TextAlign.justify,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Entrepreneurship Experience',
                        textAlign: TextAlign.start,
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 8),
                      Column(
                        children: _entrepreneurshipExperience
                            .map(
                              (entrepreneurshipExperience) => Column(
                                children: [
                                  Text(
                                    '• ' + entrepreneurshipExperience,
                                    textAlign: TextAlign.justify,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'education',
                        textAlign: TextAlign.start,
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 8),
                      Column(
                        children: _education
                            .map(
                              (education) => Column(
                                children: [
                                  Text(
                                    '• ' + education,
                                    textAlign: TextAlign.justify,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Industry Certifications',
                        textAlign: TextAlign.start,
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 8),
                      Column(
                        children: _industryCertifications
                            .map(
                              (industryCertifications) => Column(
                                children: [
                                  Text(
                                    '• ' + industryCertifications,
                                    textAlign: TextAlign.justify,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Awards Achievements',
                        textAlign: TextAlign.start,
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 8),
                      Column(
                        children: _awardsAchievements
                            .map(
                              (awardsAchievements) => Column(
                                children: [
                                  Text(
                                    '• ' + awardsAchievements,
                                    textAlign: TextAlign.left,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Track Record',
                        textAlign: TextAlign.start,
                        style: ralewayStyle.copyWith(
                          fontSize: 18.0,
                          color: AppColors.blueDarkColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Divider(thickness: 2),
                      SizedBox(height: 8),
                      Column(
                        children: _trackRecord
                            .map(
                              (trackRecord) => Column(
                                children: [
                                  Text(
                                    '• ' + trackRecord,
                                    textAlign: TextAlign.left,
                                    style: ralewayStyle.copyWith(
                                      fontSize: 16.0,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlueColor,
        title: Text('User Design Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Text(
                'INVEST IN ' + _businessName,
                style: ralewayStyle.copyWith(
                  fontSize: 16.0,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Spacer(),
              Text(
                _businessLocation,
                style: ralewayStyle.copyWith(
                  fontSize: 16.0,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            _executiveSummary,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              Image.network(
                (widget.business.businessImgUrl),
                height: 175,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _showEunDetailsDialog(context, widget.business);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(widget.business.UserImgUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 40,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          launch(_facebook);
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: Image.asset(AppIcons.facebookIcon),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launch(_twitter);
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: Image.asset(AppIcons.twitterIcon),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launch(_linkedin);
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: Image.asset(AppIcons.linkedinIcon),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launch(_instagram);
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          child: Image.asset(AppIcons.instagramIcon),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launch(_Userwebsite);
                        },
                        child: Icon(Icons.language),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  children: _industries.map((industry) => Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      industry,
                      style: ralewayStyle.copyWith(
                        fontSize: 16.0,
                        color: AppColors.blueDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )).toList(),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: AppColors.lightBlueColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  'Invest Amount \$'+_fundAmount,
                                                                  style: ralewayStyle.copyWith(
                                                                    fontSize: 16.0,
                                                                    color: AppColors.textColor,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                                ),
                                                                SizedBox(height: 10.0),
                                                                Text(
                                                                  'Avaiable Fund \$' + _availableFundAmount,
                                                                  style: ralewayStyle.copyWith(
                                                                    fontSize: 16.0,
                                                                    color: AppColors.textColor,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            _companyDescription,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Business Model',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 6),
          Text(
            _businessModel,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Value Proposition',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _valueProposition,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Product or Service',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _productOrServiceOffering,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Funding Needs',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _fundingNeeds,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Timeline',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _timeline,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Funding Sources',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _fundingSources,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Investment Benefits',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _investorBenefits,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Investment Terms',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _investmentTerms,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Risk Factors',
            textAlign: TextAlign.start,
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 8),
          Text(
            _riskFactors,
            textAlign: TextAlign.justify,
            style: ralewayStyle.copyWith(
              fontSize: 16.0,
              color: AppColors.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.white,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.mainBlueColor),
                              value: 0.5, // set the progress bar value here
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.white,
                            child: ElevatedButton(
                              onPressed: () {
                                _showAddPaymentDetailsDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors
                                    .mainBlueColor, // set the background color of the button
                              ),
                              child: Text(
                                'INVEST',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
