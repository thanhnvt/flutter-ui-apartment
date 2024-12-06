class ApartmentModel {

  final String cover;
  final String createdDate;
  final String name;
  final String project;
  final String type;
  final int price;
  final int rooms;
  final int bathroom;
  final int acreage;

  ApartmentModel({required this.cover, required this.createdDate, required this.name, required this.project, required this.type, required this.price, required this.rooms, required this.bathroom, required this.acreage});

  factory ApartmentModel.fromJson(Map<String, dynamic> json){
   return ApartmentModel(
      cover: json['cover'],
      createdDate: json['createdDate'],
      price: json['price'],
      name: json['name'],
      rooms: json['rooms'],
      bathroom: json['bathroom'],
      acreage: json['acreage'],
      project: json['project'],
      type: json['type']
    );
  }
}