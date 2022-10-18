class User {
  //TODO: Add the rest of the naccesary properties
  final String name;
  final String lastName;
  final String email;
  UserRole role;
  List<UserPermissions> permissions;

  User({
    required this.name,
    required this.lastName,
    required this.email,
    required this.role,
    List<UserPermissions>? permissionList,
  }) : permissions = permissionList ?? [];
}

enum UserRole {
  admin,
  headTeacher,
  teacher,
  parent,
  student,
}

//TODO: Finish user permissions
enum UserPermissions {
  breath,
}