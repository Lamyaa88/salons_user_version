class AllPastAppointmentsModel {
  final int id;
  final String name;
  final String  image ;
  final String email ;
  final String phone ;
  final String type ;


  AllPastAppointmentsModel(
      {this.id,

        this.name ,
        this.image,
        this.email,
        this.phone,
        this.type,
      });

  factory AllPastAppointmentsModel.fromJson(Map<String, dynamic> json) {
    return AllPastAppointmentsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      email: json['email'],
      phone: json['phone'],
      type: json['type'],


    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'email': email,
      'phone': phone,
      'type': type,
    };
  }
}
