import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_room_screen.dart';
import 'package:uni_exam/widgets/room_detail_screen.dart';
import '../services/room_service.dart';
import '../models/room.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final RoomService _roomService = RoomService();
  List<Room> _rooms = [];

  @override
  void initState() {
    super.initState();
    _rooms = _roomService.getAllRooms();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Phòng học'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add room screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddRoomScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _rooms.length,
          itemBuilder: (context, index) {
            final room = _rooms[index];
            return CupertinoListTile(
              title: Text(room.name),
              subtitle: Text(room.roomCode),
              onTap: () {
                // TODO: Navigate to room detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => RoomDetailScreen(room: room),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}