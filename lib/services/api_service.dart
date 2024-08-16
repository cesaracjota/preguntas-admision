import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  String url = "https://api-cesaracjota.vercel.app/api/certificados";

  Future<dynamic> _getCertificados() async {
    try {
      final respuesta = await http.get(url as Uri);
      if (respuesta.statusCode == 200) {
        return jsonDecode(respuesta.body);
      }
    } catch (e) {
      print('Error fetching data $e');
    }
  }
}
