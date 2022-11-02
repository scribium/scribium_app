class User {
  //TODO: Add the rest of the naccesary properties
  final String token;
  final String name;
  final String lastName;
  final String email;
  final String address;
  final int phone;
  List<UserRole> role;
  List<UserPermissions> permissions;

  User(
    this.token, {
    required this.name,
    required this.lastName,
    required this.email,
    required this.role,
    required this.address,
    required this.phone,
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

extension GetByName on UserRole {
  String getByName(String role) {
    return name == role ? name : "";
  }
}

//TODO: Finish user permissions
enum UserPermissions {
  breath,
}
