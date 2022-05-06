import 'package:objectbox/objectbox.dart';

@Entity()
class Event{
  int? id;
  String name;
  DateTime dateTime;
  String? note;
  Event({this.id, required this.name, required this.dateTime, this.note});
}