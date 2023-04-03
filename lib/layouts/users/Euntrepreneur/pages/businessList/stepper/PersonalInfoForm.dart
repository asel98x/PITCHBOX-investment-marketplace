import 'package:flutter/material.dart';
import 'package:pitchbox/backend/model/entrepreneur.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:pitchbox/styles/appStyles.dart';


class PersonalInfoForm extends StatefulWidget {
  late final Entrepreneur entrepreneur;
  final Function onNext;

  PersonalInfoForm({required this.entrepreneur, required this.onNext});

  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _professionalExperienceController = <TextEditingController>[TextEditingController()];
  final _entrepreneurshipExperienceController = <TextEditingController>[TextEditingController()];
  final _educationController = <TextEditingController>[TextEditingController()];
  final _industryCertificationsController = <TextEditingController>[TextEditingController()];
  final _awardsAchievementsController = <TextEditingController>[TextEditingController()];
  final _trackRecordController = <TextEditingController>[TextEditingController()];
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _twitterController = TextEditingController();
  final _instagramController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _professionalExperienceController.forEach((controller) => controller.dispose());
    _entrepreneurshipExperienceController.forEach((controller) => controller.dispose());
    _educationController.forEach((controller) => controller.dispose());
    _industryCertificationsController.forEach((controller) => controller.dispose());
    _awardsAchievementsController.forEach((controller) => controller.dispose());
    _trackRecordController.forEach((controller) => controller.dispose());
    _emailController.dispose();
    _facebookController.dispose();
    _twitterController.dispose();
    _instagramController.dispose();
    _linkedinController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.entrepreneur != null) {
      _fullNameController.text = widget.entrepreneur.name;
      _phoneController.text = widget.entrepreneur.mobile;
      _cityController.text = widget.entrepreneur.city;
      _emailController.text = widget.entrepreneur.email;
      _facebookController.text = widget.entrepreneur.facebook;
      _twitterController.text = widget.entrepreneur.twitter;
      _instagramController.text = widget.entrepreneur.instagram;
      _linkedinController.text = widget.entrepreneur.linkedin;
      _websiteController.text = widget.entrepreneur.website;
    }
  }

  void _addProfessionalExperienceField() {
    setState(() {
      _professionalExperienceController.add(TextEditingController());
    });
  }
  void _addEntrepreneurshipExperienceField() {
    setState(() {
      _entrepreneurshipExperienceController.add(TextEditingController());
    });
  }
  void _addEducationExperienceField() {
    setState(() {
      _educationController.add(TextEditingController());
    });
  }
  void _addindustryCertificationsField() {
    setState(() {
      _industryCertificationsController.add(TextEditingController());
    });
  }
  void _addawardsAchievementsField() {
    setState(() {
      _awardsAchievementsController.add(TextEditingController());
    });
  }
  void _addtrackRecordField() {
    setState(() {
      _trackRecordController.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              suffixIcon: Tooltip(
                message: 'Full Name',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Business Name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Mobile',
              suffixIcon: Tooltip(
                message: 'Mobile',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Mobile number';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: 'City',
              suffixIcon: Tooltip(
                message: 'City',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter City';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _countryController,
            decoration: InputDecoration(
              labelText: 'Country',
              suffixIcon: Tooltip(
                message: 'Country',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Country';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Professional Experience",
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _professionalExperienceController.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _professionalExperienceController[index],
                          decoration: InputDecoration(
                            labelText: 'Professional Experience',
                            suffixIcon: Tooltip(
                              message: 'Professional Experience',
                              child: IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _professionalExperienceController.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: () {
              _addProfessionalExperienceField();
            },
          ),
          SizedBox(height: 20),

          //--------------------------------------------------------------------------------

          Text(
            "Entrepreneurship Experience",
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _entrepreneurshipExperienceController.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _entrepreneurshipExperienceController[index],
                          decoration: InputDecoration(
                            labelText: 'Entrepreneurship Experience',
                            suffixIcon: Tooltip(
                              message: 'Entrepreneurship Experience',
                              child: IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _entrepreneurshipExperienceController.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: () {
              _addEntrepreneurshipExperienceField();
            },
          ),

          //--------------------------------------------------------------------------------

          Text(
            "Education",
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _educationController.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _educationController[index],
                          decoration: InputDecoration(
                            labelText: 'Education',
                            suffixIcon: Tooltip(
                              message: 'Education',
                              child: IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _educationController.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: () {
              _addEducationExperienceField();
            },
          ),

          //--------------------------------------------------------------------------------

          Text(
            "Industry Certifications",
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _industryCertificationsController.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _industryCertificationsController[index],
                          decoration: InputDecoration(
                            labelText: 'Industry Certifications',
                            suffixIcon: Tooltip(
                              message: 'Industry Certifications',
                              child: IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _industryCertificationsController.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: () {
              _addindustryCertificationsField();
            },
          ),

          //--------------------------------------------------------------------------------

          Text(
            "Awards Achievements",
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _awardsAchievementsController.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _awardsAchievementsController[index],
                          decoration: InputDecoration(
                            labelText: 'Awards Achievements',
                            suffixIcon: Tooltip(
                              message: 'Awards Achievements',
                              child: IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _awardsAchievementsController.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: () {
              _addawardsAchievementsField();
            },
          ),

          //--------------------------------------------------------------------------------

          Text(
            "Track Record",
            style: ralewayStyle.copyWith(
              fontSize: 18.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _trackRecordController.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _trackRecordController[index],
                          decoration: InputDecoration(
                            labelText: 'Track Record',
                            suffixIcon: Tooltip(
                              message: 'Track Record',
                              child: IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _trackRecordController.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: () {
              _addtrackRecordField();
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              suffixIcon: Tooltip(
                message: 'enter Email',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _linkedinController,
            decoration: InputDecoration(
              labelText: 'Linkedin profile',
              suffixIcon: Tooltip(
                message: 'enter Linkedin profile link',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _facebookController,
            decoration: InputDecoration(
              labelText: 'Facebook profile',
              suffixIcon: Tooltip(
                message: 'enter Facebook profile link',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _twitterController,
            decoration: InputDecoration(
              labelText: 'Twitter profile',
              suffixIcon: Tooltip(
                message: 'enter Twitter profile link',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _instagramController,
            decoration: InputDecoration(
              labelText: 'Instagram profile',
              suffixIcon: Tooltip(
                message: 'enter Instagram profile link',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _websiteController,
            decoration: InputDecoration(
              labelText: 'Website',
              suffixIcon: Tooltip(
                message: 'enter Website link',
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(),
              ),
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    List<String> professionalExperienceList = [];
                    _professionalExperienceController.forEach((controller) {
                      professionalExperienceList.add(controller.text);
                    });
                    List<String> entrepreneurshipExperienceList = [];
                    _entrepreneurshipExperienceController.forEach((controller) {
                      entrepreneurshipExperienceList.add(controller.text);
                    });
                    List<String> educationList = [];
                    _educationController.forEach((controller) {
                      educationList.add(controller.text);
                    });
                    List<String> industryCertificationsList = [];
                    _industryCertificationsController.forEach((controller) {
                      industryCertificationsList.add(controller.text);
                    });
                    List<String> awardsAchievementsList = [];
                    _awardsAchievementsController.forEach((controller) {
                      awardsAchievementsList.add(controller.text);
                    });
                    List<String> trackRecordList = [];
                    _trackRecordController.forEach((controller) {
                      trackRecordList.add(controller.text);
                    });
                    widget.entrepreneur.name = _fullNameController.text;
                    widget.entrepreneur.mobile = _phoneController.text;
                    widget.entrepreneur.city = _cityController.text;
                    widget.entrepreneur.country = _countryController.text;
                    widget.entrepreneur.professionalExperience = professionalExperienceList;
                    widget.entrepreneur.entrepreneurshipExperience = entrepreneurshipExperienceList;
                    widget.entrepreneur.education = educationList;
                    widget.entrepreneur.industryCertifications = industryCertificationsList;
                    widget.entrepreneur.awardsAchievements = awardsAchievementsList;
                    widget.entrepreneur.trackRecord = trackRecordList;
                    widget.entrepreneur.email = _emailController.text;
                    widget.entrepreneur.website = _websiteController.text;
                    widget.entrepreneur.facebook = _facebookController.text;
                    widget.entrepreneur.twitter = _twitterController.text;
                    widget.entrepreneur.linkedin = _linkedinController.text;
                    widget.entrepreneur.instagram = _instagramController.text;
                    widget.onNext();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
