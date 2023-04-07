import 'package:flutter/material.dart';

import '../../../../../../backend/model/businessTeam.dart';

class BusinessTeamMemberInfoForm extends StatefulWidget {
  late final BusinessTeam businessTeam;
  late final Function onNext;
  List<BusinessTeam> teamMembers = [];

  BusinessTeamMemberInfoForm({required this.teamMembers, required this.onNext});

  @override
  _BusinessTeamMemberInfoFormState createState() => _BusinessTeamMemberInfoFormState();
}

class _BusinessTeamMemberInfoFormState extends State<BusinessTeamMemberInfoForm> {
  List<BusinessTeam> _teamMembersList = [];

  final _formKey = GlobalKey<FormState>();
  final _teamMember = TextEditingController();
  final _teamMemberRole = TextEditingController();
  final _teamMemberExperience = TextEditingController();
  final _teamMemberAchievements = TextEditingController();
  final _teamMemberLinkedInProfiles = TextEditingController();
  final _teamMemberResponsibilities = TextEditingController();
  final _teamCulture = TextEditingController();

  void _addTeamMember() {
    setState(() {
      // create a new BusinessTeam object with default values for each field
      BusinessTeam newMember = BusinessTeam(
        teamMemberId: '',
        teamMember: '',
        teamMemberRole: '',
        teamMemberExperience: '',
        teamMemberAchievements: '',
        teamMemberLinkedIn_Profiles: '',
        teamMemberResponsibilities: '',
        teamCulture: '',
      );
      // add the new member to the list
      _teamMembersList.add(newMember);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
                itemCount: _teamMembersList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == _teamMembersList.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        child: Text('Add Team Member'),
                        onPressed: () {
                          setState(() {
                            _teamMembersList.add(BusinessTeam(
                              teamMemberId: '',
                              teamMember: '',
                              teamMemberRole: '',
                              teamMemberExperience: '',
                              teamMemberAchievements: '',
                              teamMemberLinkedIn_Profiles: '',
                              teamMemberResponsibilities: '',
                              teamCulture: '',
                            ));
                          });
                        },
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Team Member ${index + 1}'),
                          TextFormField(
                            controller: _teamMember,
                            //initialValue: _teamMembersList[index].teamMember,
                            decoration: InputDecoration(labelText: 'Name'),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamMember = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _teamMemberRole,
                            //initialValue: _teamMembersList[index].teamMemberRole,
                            decoration: InputDecoration(labelText: 'Role'),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamMemberRole = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _teamMemberExperience,
                            //initialValue: _teamMembersList[index].teamMemberExperience,
                            decoration: InputDecoration(labelText: 'Experience'),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamMemberExperience = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _teamMemberAchievements,
                            //initialValue: _teamMembersList[index].teamMemberAchievements,
                            decoration: InputDecoration(labelText: 'Achievements'),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamMemberAchievements = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _teamMemberLinkedInProfiles,
                            //initialValue: _teamMembersList[index].teamMemberLinkedIn_Profiles,
                            decoration: InputDecoration(labelText: 'LinkedIn Profiles'),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamMemberLinkedIn_Profiles = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _teamMemberResponsibilities,
                            //initialValue: _teamMembersList[index].teamMemberResponsibilities,
                            decoration: InputDecoration(labelText: 'Responsibilities'),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamMemberResponsibilities = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: _teamCulture,
                            //initialValue: _teamMembersList[index].teamCulture,
                            decoration: InputDecoration(
                              labelText: 'Team Culture',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _teamMembersList[index].teamCulture = value;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),

            SizedBox(height: 20),
            ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {

                      for (int i = 0; i < _teamMembersList.length; i++) {
                        BusinessTeam teamMember = _teamMembersList[i];
                        String name1 = _teamMembersList[i].teamMember;
                        String role = _teamMembersList[i].teamMemberRole;
                        String experience = _teamMembersList[i].teamMemberExperience;
                        String achievements = _teamMembersList[i].teamMemberAchievements;
                        String linkedInProfiles = _teamMembersList[i].teamMemberLinkedIn_Profiles;
                        String responsibilities =_teamMembersList[i].teamMemberResponsibilities;
                        String teamCulture = _teamMembersList[i].teamCulture;
                        BusinessTeam newTeamMember = BusinessTeam(
                          teamMemberId: teamMember.teamMemberId,
                          teamMember: name1,
                          teamMemberRole: role,
                          teamMemberExperience: experience,
                          teamMemberAchievements: achievements,
                          teamMemberLinkedIn_Profiles: linkedInProfiles,
                          teamMemberResponsibilities: responsibilities,
                          teamCulture: teamCulture,
                        );
                        widget.teamMembers.add(newTeamMember);

                      }
                      widget.onNext();
                    }

                }),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
