class User {
  //TODO: Add the rest of the naccesary properties
  final String token;
  final UserDetails details;
  List<UserRole> role;
  List<UserPermissions> permissions;

  User(
    this.token, {
    required this.details,
    required this.role,
    List<UserPermissions>? permissionList,
  }) : permissions = permissionList ?? [];
}

class UserDetails {
  final String name;
  final String lastName;
  final String email;
  final String address;
  final int phone;

  UserDetails({
    required this.name,
    required this.lastName,
    required this.email,
    required this.address,
    required this.phone,
  });
}

enum UserRole {
  admin,
  headTeacher,
  teacher,
  parent,
  student,
}

extension GetByName on UserRole {
  String getByName(String role) {
    return name == role ? name : "";
  }
}

//TODO: Finish user permissions
enum UserPermissions {
  breath,
}
