class UsersModals {
  String accessToken;
  UserModals user;

  UsersModals({
    this.accessToken,
    this.user,
  });

  factory UsersModals.fromJson(Map<String, dynamic> json) {
    return UsersModals(
      accessToken: json['access_token'],
      user: json['user'] != null ? UserModals.fromJson(json['user']) : null,
    );
  }

//  UsersModals.fromJson(Map<String, dynamic> json) {
//    accessToken =  json['access_token'];
//    user  = json['user'] != null ?  UserModals.fromJson(json['user']) : null ;
// }
}

class UsersRegister {
  AccessToken accessToken;
  UserModals user;
  UsersRegister({
    this.accessToken,
    this.user,
  });

  factory UsersRegister.fromJson(Map<String, dynamic> json) {
    return UsersRegister(
      accessToken: AccessToken.fromJson(json['access_token']),
      user: UserModals.fromJson(json['user']),
    );
  }
}

class AccessToken {
  String token;
  AccessToken({
    this.token,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      token: json['token'],
    );
  }
}

class UserModals {
  int id;
  String name;
  String email;
  String avatar;
  String created_at;
  String updated_at;
  String phone;
  String type;
  String role_id;

  UserModals({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.created_at,
    this.updated_at,
    this.phone,
    this.role_id,
    this.type,
  });

  factory UserModals.fromJson(Map<String, dynamic> json) {
    return UserModals(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      created_at: json['created_at'],
      updated_at: json['update_at'],
      phone: json['phone'],
      role_id: json['role_id'],
      type: json['type'],
    );
  }
}
