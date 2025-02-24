class Room {
  final String id;
  final String roomCode;
  final String name;
  final int capacity;
  final List<String> equipment;
  final String location;

  Room({
    required this.id,
    required this.roomCode,
    required this.name,
    required this.capacity,
    required this.equipment,
    required this.location,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomCode: json['roomCode'],
      name: json['name'],
      capacity: json['capacity'],
      equipment: List<String>.from(json['equipment']),
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomCode': roomCode,
      'name': name,
      'capacity': capacity,
      'equipment': equipment,
      'location': location,
    };
  }
}