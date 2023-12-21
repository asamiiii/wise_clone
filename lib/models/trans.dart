import 'package:hive/hive.dart';
part 'trans.g.dart';
@HiveType(typeId: 1)
class DetailsData extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  String? ammount;
  @HiveField(3)
  bool? sent;
  @HiveField(4)
  DateTime? time;
  

  DetailsData({this.id,this.userName,this.ammount,this.sent,this.time});
}