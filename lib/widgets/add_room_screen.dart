import 'package:flutter/cupertino.dart';
import '../models/room.dart';
import '../services/room_service.dart';

class AddRoomScreen extends StatefulWidget {
  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final _formKey = GlobalKey<FormState>();
  final _roomService = RoomService();
  final _roomCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _capacityController = TextEditingController();
  final _equipmentController = TextEditingController();
  final _locationController = TextEditingController();

  void _addRoom() {
    if (_formKey.currentState!.validate()) {
      final room = Room(
        id: DateTime.now().toString(), // Generate a unique ID
        roomCode: _roomCodeController.text,
        name: _nameController.text,
        capacity: int.parse(_capacityController.text),
        equipment: _equipmentController.text.split(','),
        location: _locationController.text,
      );
      _roomService.createRoom(room);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm phòng học'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã phòng học'),
                  controller: _roomCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã phòng học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên phòng học'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên phòng học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Sức chứa'),
                  controller: _capacityController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập sức chứa';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Trang thiết bị'),
                  controller: _equipmentController,
                  maxLines: 3,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Vị trí'),
                  controller: _locationController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addRoom,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}