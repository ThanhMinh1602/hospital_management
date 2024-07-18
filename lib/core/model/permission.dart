class Permission {
  int id;
  List<int> role;

  Permission({
    required this.id,
    required this.role,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'],
      role: List<int>.from(json['Role'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Role': List<dynamic>.from(role.map((x) => x)),
    };
  }
}
