class UserBlocklistModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<BlockedUser> data;

  UserBlocklistModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UserBlocklistModel.fromJson(Map<String, dynamic> json) {
    return UserBlocklistModel(
      success: json["success"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
      data: (json["data"] as List?)
              ?.map((e) => BlockedUser.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class BlockedUser {
  final String id;
  final String name;
  final String personId;
  final String profileImage;
  final String status;

  BlockedUser({
    required this.id,
    required this.name,
    required this.personId,
    required this.profileImage,
    required this.status,
  });

  factory BlockedUser.fromJson(Map<String, dynamic> json) {
    return BlockedUser(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      personId: json["personId"] ?? "",
      profileImage: json["profileImage"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
