import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiService {
  Future<String> classifyImage(File imageFile) async {
    try {
      var uri = Uri.parse('http://localhost:5000/predict');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var result = String.fromCharCodes(responseData);
        var json = jsonDecode(result);
        return json['flower'];
      } else {
        return 'Error from API';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}