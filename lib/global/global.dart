library LapangBola.global;

import 'package:lapang_bola_flutter/models/club_response.dart';
import 'package:lapang_bola_flutter/models/myMatch_response.dart';
import 'package:lapang_bola_flutter/models/playerDetail_reponse.dart';
import 'package:lapang_bola_flutter/my_match.dart';
import 'dart:io';

String auth_token = "";
bool is_Login = false;
String name = "";
String email = "";
String gender = "";
String phone_number = "";
String photoUrl = "";
File tempPicture = null;

int playerID = 0;

MyMatchResponse myMatchResponse;
PlayerDetailResponse playerDetailReponse;
ClubResponse clubResponse;