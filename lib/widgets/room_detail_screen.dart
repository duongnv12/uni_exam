import 'package:flutter/cupertino.dart';
import '../models/room.dart';

class RoomDetailScreen extends StatelessWidget {
  final Room room;

  RoomDetailScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(room.name),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã phòng học: ${room.roomCode}'),
              SizedBox(height: 8.0),
              Text('Tên phòng học: ${room.name}'),
              SizedBox(height: 8.0),
              Text('Sức chứa: ${room.capacity}'),
              SizedBox(height: 8.0),
              Text('Trang thiết bị: ${room.equipment.join(', ')}'),
              SizedBox(height: 8.0),
              Text('Vị trí: ${room.location}'),
            ],
          ),
        ),
      ),
    );
  }
}