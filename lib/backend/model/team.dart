

import 'package:cloud_firestore/cloud_firestore.dart';

class Team {
  late String id;
  late String teamMemberId;
  late String teamMemberName;
  late String role;
  late String responsibility;
  late String experienceId;
  late String experience;
  late String achievementId;
  late String achievement;
  late String teamMemberLinkedin;
  late String teamCulture;

  Team({
    required this.id,
    required this.teamMemberId,
    required this.teamMemberName,
    required this.role,
    required this.responsibility,
    required this.experienceId,
    required this.experience,
    required this.achievementId,
    required this.achievement,
    required this.teamMemberLinkedin,
    required this.teamCulture,
  });

  factory Team.fromSnapshot(DocumentSnapshot snapshot) {
    return Team(
      id: snapshot.id,
      teamMemberId: snapshot['teamMemberId'],
      teamMemberName: snapshot['teamMemberName'],
      role: snapshot['role'],
      responsibility: snapshot['responsibility'],
      experienceId: snapshot['experienceId'],
      experience: snapshot['experience'],
      achievementId: snapshot['achievementId'],
      achievement: snapshot['achievement'],
      teamMemberLinkedin: snapshot['teamMemberLinkedin'],
      teamCulture: snapshot['teamCulture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teamMemberId': teamMemberId,
      'teamMemberName': teamMemberName,
      'role': role,
      'responsibility': responsibility,
      'experienceId': experienceId,
      'experience': experience,
      'achievementId': achievementId,
      'achievement': achievement,
      'teamMemberLinkedin': teamMemberLinkedin,
      'teamCulture': teamCulture,
    };
  }
}
