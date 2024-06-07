import 'package:con_verse_email_verification/config.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool>verifyUser(String token)async{
  try{
    final response = await http.post(
      Uri.parse("${dotenv.env['API_URL']}/${token}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode==200)
    {
      return true;
    }
    else
      {
        return false;
      }
  }catch(err)
  {
    return false;
  }
}