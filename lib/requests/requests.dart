import 'dart:convert';
import 'package:gambot/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gambot/models/user.dart';
import 'package:gambot/requests/URLs.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;



Future<List<User>> fetchUsersExample() async {
  final response = await get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200)
    return User.getListUsers(json.decode(response.body));

  else
    throw Exception('Failed to load User');
}



Future<dynamic> fetchPlayersInGame() async {
  try {
    final response = await get(URLs.ipMatheusGateway + 'get_players_in_game');

    if (response.statusCode == 200)
      return json.decode(response.body);

    else 
      throw Exception('Failed to load User');

  } on Exception catch(e) {
    print("\n\nErro:");
    print(e);
  }
  return null;
}


Future<dynamic> participateGame() async {
    final firebase = FirebaseMessaging();
    var device_id = await firebase.getToken();

    Map<String,String> headers = {
      'Content-type' : 'application/json', 
      'Accept': 'application/json',
    };

    final response = await post(URLs.ipMatheusGateway + 'post_player_in_game', 
                                headers: headers,
                                body: json.encode({'player_id': Global.playerId, 'device_id': device_id}));

    if (response.statusCode == 200) 
      Global.currentGameId = json.decode(response.body)['game_id'];

    else
      throw Exception('Não foi possível juntar-se à partida');

    return null;
}



Future<dynamic> dropGame() async {
  String url = URLs.ipMatheusGateway + 'delete_player_in_game?player_id=' + Global.playerId.toString() + '&game_id=' + Global.currentGameId.toString();
  final response = await delete(url);

  if (response.statusCode == 200) 
    Global.currentGameId = null;

  else
    throw Exception('Não foi possível sair do jogo.');

  return null;
}



Future<dynamic> startGame() async {
  String url = URLs.ipMatheusGateway + 'start_game';
  final response = await post(url);

  if (response.statusCode == 200)
    return null;

  else
    throw Exception('Não foi possível iniciar o jogo (veja se já não foi iniciado!!).');
}

Future<dynamic> startRound() async {
  String url = URLs.ipMatheusGateway + 'create_round';
  final response = await post(url);

  if(response.statusCode == 200)
    return null;
  else
  throw Exception('Não foi possivel inicar um round');
}

Future<dynamic> getRoundId() async {
  String url = URLs.ipMatheusGateway + 'get_round_id';
  final response = await get(url);

  if(response.statusCode == 200) {
    Global.roundId = json.decode(response.body)['round_id'];
    return null;
  }
}

Future<dynamic> roundRedirect() async {
  String url = URLs.ipMatheusGateway + 'round_redirect';
  final response = await post(url);

  if(response.statusCode == 200)
    return null;
}

Future<dynamic> getPlayerMoney() async {
  String url = URLs.ipMatheusGateway + 'get_player_money?game_id=' + Global.currentGameId.toString() +
    '&player_id=' + Global.playerId.toString();
  final response = await get(url);

  if(response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
    Global.playerMoney = data['money'];
    print(Global.playerMoney);
  } else{
    throw Exception('Não foi possível pegar o dinheiro do jogador');
  }
}

Future<dynamic> getBet() async {
  String url = URLs.ipMatheusGateway + 'get_round_bet?round_id=' + Global.roundId.toString();
  final response = await get(url);

  if(response.statusCode == 200){
    var data = json.decode(response.body);
    Global.roundBet = data['bet'];
  }
  else
  throw Exception('Não foi possivel pegar o valor de aposta');
}

Future<dynamic> payBet() async {
  String url = URLs.ipMatheusGateway + 'pay_bet';
  
  try{
    final response = await http.post(
      url,
      body: json.encode({"round_id": Global.roundId, "player_id": Global.playerId, "game_id": Global.currentGameId}),
      headers: {"Content-Type": "application/json"},
    );

    if(response.statusCode != 200) {
      var error = json.decode(response.body);
      throw new Exception(error['message']);
    }
  } on Exception catch(error) {
    throw error;
  }

}

Future<dynamic> leaveMatch() async {
  String url = URLs.ipMatheusGateway + 'leave_match';

  try {
    final response = await http.post(
      url,
      body: json.encode({"game_id": Global.currentGameId, "player_id": Global.playerId, "round_id": Global.roundId}),
      headers: {"Content-Type": "application/json"},
    );

    if(response.statusCode != 200) {
      var error = json.decode(response.body);
      throw new Exception(error['message']);
    }
  } on Exception catch(error) {
    throw error;
  }
}

Future<dynamic> getCurrentPlayer() async {
  String url = URLs.ipMatheusGateway + 'get_current_player?round_id=' + Global.roundId.toString();

  try{
    final response = await http.get(url);

    if(response.statusCode == 200) {
      var data = json.decode(response.body);
      Global.playerTurnId = data['current_player_id'];
    } else {
      var error = json.decode(response.body);
      throw new Exception(error['message']);
    }
  } on Exception catch(error) {
    throw error;
  }
 }



Future<dynamic> postPlayerId() async {
  String url = URLs.ipMatheusGateway + 'post_player_id';
  
  final response = await post(url,
    body: json.encode({"player_id": Global.playerId}),
    headers: {"Content-Type": "application/json"},
  );

  if(response.statusCode == 200) {
    return 'Reconhecido com sucesso!';
  }
  else {
    return 'Erro ao tentar reconhecer, tente novamente!';
  }
}



Future<dynamic> skip() async {
  String url = URLs.ipMatheusGateway + 'post_ignore_player';
  
  final response = await post(url);

  if(response.statusCode == 200) {
    return 'Pulado';
  }
  else {
    return 'Erro ao tentar pular, tente novamente!';
  }
}



Future<dynamic> endRecognition() async {
  String url = URLs.ipMatheusGateway + 'post_end_recognition';
  
  final response = await post(url);

  if(response.statusCode == 200) {
    return 'Finalizado';
  }
  else {
    return 'Erro ao finalizar o reconhecimento, tente novamente!';
  }
}


Widget builder(Function future, Function callbackFunction) {
  return FutureBuilder<dynamic>(
      future: future(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return callbackFunction(snapshot.data);
          
        else if (snapshot.hasError) 
          return Text("${snapshot.error}");

        return CircularProgressIndicator();
      });
}
