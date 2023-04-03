import 'package:flutter/material.dart';

import '../../../../../../backend/model/businessTeam.dart';

class BusinessTeamForm extends StatefulWidget {
  @override
  _BusinessTeamFormState createState() => _BusinessTeamFormState();
}

class _BusinessTeamFormState extends State<BusinessTeamForm> {
  List<BusinessTeam> _teamMembers = [];

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
      _teamMembers.add(newMember);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Business Team Form')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _teamMembers.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == _teamMembers.length) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      child: Text('Add Team Member'),
                      onPressed: () {
                        setState(() {
                          _teamMembers.add(BusinessTeam(
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
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Team Member ${index + 1}'),
                            TextFormField(
                              initialValue: _teamMembers[index].teamMember,
                              decoration: InputDecoration(labelText: 'Name'),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index].teamMember = value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: _teamMembers[index].teamMemberRole,
                              decoration: InputDecoration(labelText: 'Role'),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index].teamMemberRole = value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue:
                              _teamMembers[index].teamMemberExperience,
                              decoration:
                              InputDecoration(labelText: 'Experience'),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index].teamMemberExperience =
                                      value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue:
                              _teamMembers[index].teamMemberAchievements,
                              decoration:
                              InputDecoration(labelText: 'Achievements'),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index].teamMemberAchievements =
                                      value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue:
                              _teamMembers[index].teamMemberLinkedIn_Profiles,
                              decoration: InputDecoration(
                                  labelText: 'LinkedIn Profiles'),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index]
                                      .teamMemberLinkedIn_Profiles =
                                      value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue:
                              _teamMembers[index].teamMemberResponsibilities,
                              decoration:
                              InputDecoration(labelText: 'Responsibilities'),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index]
                                      .teamMemberResponsibilities =
                                      value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: _teamMembers[index].teamCulture,
                              decoration: InputDecoration(
                                labelText: 'Team Culture',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _teamMembers[index].teamCulture = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              child: Text('Next'),
            onPressed: (){

            }
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

}

