class Player {
  final int id;
  final String name;

  Player({this.id, this.name});


  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name']
    );
  }


  static List<Player> getListPlayers(List<dynamic> playersJson) {
    List<Player> playerList = List<Player>();
    playersJson.forEach((playerJson) => playerList.add(Player.fromJson(playerJson)));

    return playerList;
  } 
} 