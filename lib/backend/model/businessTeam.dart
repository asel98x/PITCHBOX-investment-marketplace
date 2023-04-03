class BusinessTeam {
  String _teamMemberId;
  String _teamMember;
  String _teamMemberRole;
  String _teamMemberExperience;
  String _teamMemberAchievements;
  String _teamMemberLinkedIn_Profiles;
  String _teamMemberResponsibilities;
  String _teamCulture;

  BusinessTeam({
    required String  teamMemberId,
    required String teamMember,
    required String teamMemberRole,
    required String teamMemberExperience,
    required String teamMemberAchievements,
    required String teamMemberLinkedIn_Profiles,
    required String teamMemberResponsibilities,
    required String teamCulture,
  })
      : _teamMemberId = teamMemberId,
        _teamMember = teamMember = '',
        _teamMemberRole = teamMemberRole = '',
        _teamMemberExperience = teamMemberExperience = '',
        _teamMemberAchievements = teamMemberAchievements,
        _teamMemberLinkedIn_Profiles = teamMemberLinkedIn_Profiles,
        _teamMemberResponsibilities = teamMemberResponsibilities,
        _teamCulture = teamCulture;


  String get teamMemberId => _teamMemberId;

  set teamMemberId(String teamMemberId) => _teamMemberId = teamMemberId;


  String get teamMember => _teamMember;

  set teamMember(String teamMember) => _teamMember = teamMember;

  String get teamMemberRole => _teamMemberRole;

  set teamMemberRole(String teamMemberRole) =>
      _teamMemberRole = teamMemberRole;

  String get teamMemberExperience => _teamMemberExperience;

  set teamMemberExperience(String teamMemberExperience) =>
      _teamMemberExperience = teamMemberExperience;

  String get teamMemberAchievements => _teamMemberAchievements;

  set teamMemberAchievements(String teamMemberAchievements) =>
      _teamMemberAchievements = teamMemberAchievements;

  String get teamMemberLinkedIn_Profiles => _teamMemberLinkedIn_Profiles;

  set teamMemberLinkedIn_Profiles(String teamMemberLinkedIn_Profiles) =>
      _teamMemberLinkedIn_Profiles = teamMemberLinkedIn_Profiles;

  String get teamMemberResponsibilities => _teamMemberResponsibilities;

  set teamMemberResponsibilities(String teamMemberResponsibilities) =>
      _teamMemberResponsibilities = teamMemberResponsibilities;
  
  String get teamCulture => _teamCulture;

  set teamCulture(String teamCulture) =>
      _teamCulture = teamCulture;

}