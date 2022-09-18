
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Todo{
  final String id;
  final String? description;


  Todo({this.description,String? id}):id =id??uuid.v4();

}