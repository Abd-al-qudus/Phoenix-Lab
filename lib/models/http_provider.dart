import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const staticUrl = 'https://flutter-pharmacy-app-default-rtdb.firebaseio.com';
const recordUrl = '$staticUrl/records';
const productUrl = '$staticUrl/products';
const productListUrl = '$staticUrl/url.json';
const cartUrl = '$staticUrl/cart';
const doctorsUrl = '$staticUrl/doctors';

class HttpRequests {
  Future<List> getUrlList() async {
    List<Map<dynamic, dynamic>> urlList = [];
    final url = Uri.parse(productListUrl);
    try {
      await http.get(url).then((value) {
        final Map<dynamic, dynamic> urlMap = jsonDecode(value.body);
        for (var element in urlMap.values) {
          urlList.add(element);
        }
      });
    } catch (e) {
      print(e);
    }
    return urlList;
  }

  Future<void> createProductCategory(
    String categoryName,
    String name,
    String price,
    String imageUrl,
    String description,
    String dosage,
    bool availability,
  ) async {
    final requestUrl = Uri.parse('$productUrl/$categoryName.json');
    try {
      await http
          .post(requestUrl,
              body: json.encode(({
                'name': name,
                'dosage': dosage,
                'description': description,
                'price': price,
                'imageUrl': imageUrl,
              })))
          .then((value) async {
        final url = Uri.parse(productListUrl);
        await http.post(url,
            body: json
                .encode(({categoryName: '$productUrl/$categoryName.json'})));
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Map> getAllProducts() async {
    Map<dynamic, dynamic> products = {};
    final url = Uri.parse('$productUrl.json');
    try {
      await http.get(url).then(
            (value) => products = jsonDecode(value.body),
          );
    } catch (e) {
      print(e);
    }
    return products;
  }

  Future<Map> getproductCategory(String productName) async {
    final Map response = {};
    final String requestUrl = '$productUrl/$productName.json';
    final url = Uri.parse(requestUrl);
    try {
      final responseMap = await http.get(url);
      final Map<dynamic, dynamic> responseJson = jsonDecode(responseMap.body);
      response.addAll(responseJson);
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<void> deleteProductCategory(String productCategory) async {
    final url = Uri.parse('$productUrl/$productCategory.json');
    try {
      final response = await http.put(url, body: jsonEncode(({})));
    } catch (e) {
      print(e);
    }
  }

  Future<void> addProducts(
    String name,
    String price,
    String imageUrl,
    String description,
    String dosage,
    bool availability,
    String categoryName,
  ) async {
    final requestUrl = Uri.parse('$productUrl/$categoryName.json');
    try {
      await http.post(requestUrl,
          body: json.encode(({
            'name': name,
            'dosage': dosage,
            'description': description,
            'price': price,
            'imageUrl': imageUrl,
          })));
    } catch (e) {
      print(e);
    }
  }

  Future<void> editProducts(
      String name,
      String price,
      String imageUrl,
      String description,
      String dosage,
      bool availability,
      String categoryName,
      String productId) async {
    final requestUrl = Uri.parse('$productUrl/$categoryName/$productId.json');
    try {
      await http.patch(requestUrl,
          body: json.encode(({
            'name': name,
            'dosage': dosage,
            'description': description,
            'price': price,
            'imageUrl': imageUrl,
            'status': availability,
          })));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(String id, String category) async {
    final editUrl = '$staticUrl/products/$category/$id.json';
    final requestUrl = Uri.parse(editUrl);
    try {
      await http.delete(requestUrl, body: jsonEncode(({})));
    } catch (e) {
      rethrow;
    }
  }

  Future<String> addRecord(Map<dynamic, dynamic> records) async {
    final requestUrl = Uri.parse('$recordUrl.json');
    try {
      final response = await http.post(requestUrl, body: jsonEncode((records)));
      final recordId = jsonDecode(response.body) as String;
      return recordId;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> getRecord(String id) async {
    Map<dynamic, dynamic> record = {};
    final requestUrl = Uri.parse('$recordUrl/$id.json');
    try {
      final response = await http.get(requestUrl);
      final Map<dynamic, dynamic> recordJson = jsonDecode(response.body);

      record.addAll(recordJson);
    } catch (e) {
      rethrow;
    }
    return record;
  }

  Future<void> editRecord(String id, Map<dynamic, dynamic> records) async {
    final requestUrl = Uri.parse('$recordUrl/$id.json');
    try {
      await http.patch(requestUrl, body: jsonEncode((records)));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteRecord(String id) async {
    final requestUrl = Uri.parse('$recordUrl/$id.json');
    try {
      await http.delete(requestUrl, body: jsonEncode(({})));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadImage(Map<dynamic, dynamic> imageMap) async {
    final requestUrl = Uri.parse('$staticUrl/images.json');
    try {
      await http.post(requestUrl, body: jsonEncode((imageMap)));
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> getUploadedImage() async {
    final requestUrl = Uri.parse('$staticUrl/images.json');
    try {
      var imageMap;
      await http.get(requestUrl).then((value) {
        imageMap = jsonDecode(value.body) as Map;
      });
      return imageMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadCartItem(
    String name,
    double price,
    int count,
    String id,
  ) async {
    final uploadUrl = Uri.parse('$cartUrl.json');
    try {
      await http.get(uploadUrl).then((value) async {
        if (jsonDecode(value.body) == null) {
          await http.post(uploadUrl,
              body: jsonEncode(({
                'name': name,
                'price': price,
                'count': count,
                'id': id,
              })));
        } else {
          final Map returnMap = jsonDecode(value.body) as Map;
          final itemMap = returnMap.values
              .toList()
              .where(
                  (element) => element['id'] == id && element['name'] == name)
              .toList();
          final index = returnMap.values.toList().indexWhere(
              (element) => element['name'] == name && element['id'] == id);
          if (index != -1) {
            final cartId = returnMap.keys.toList()[index];
            final requestUrl = Uri.parse('$cartUrl/$cartId.json');

            await http.patch(requestUrl,
                body: jsonEncode(({
                  'name': itemMap[0]['name'],
                  'id': itemMap[0]['id'],
                  'count': itemMap[0]['count'] + 1,
                  'price': itemMap[0]['price'],
                })));
          } else {
            if (itemMap.isEmpty) {
              await http.post(uploadUrl,
                  body: jsonEncode(({
                    'name': name,
                    'price': price,
                    'count': count,
                    'id': id,
                  })));
            }
          }
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> reduceCartItem(
    String id,
    String name,
  ) async {
    final requestUrl = Uri.parse('$cartUrl.json');
    try {
      await http.get(requestUrl).then((value) async {
        final returnMap = jsonDecode(value.body) as Map;
        final cartItem = returnMap.values
            .toList()
            .where((element) => element['name'] == name && element['id'] == id)
            .toList();
        final index = returnMap.values.toList().indexWhere(
              (element) => element['name'] == name && element['id'] == id,
            );
        final itemId = returnMap.keys.toList()[index];
        if (cartItem[0]['count'] > 1) {
          final url = Uri.parse('$cartUrl/$itemId.json');
          await http.patch(url,
              body: jsonEncode(({
                'name': cartItem[0]['name'],
                'id': cartItem[0]['id'],
                'count': cartItem[0]['count'] - 1,
                'price': cartItem[0]['price'],
              })));
        } else {
          final url = Uri.parse('$cartUrl/$itemId.json');
          await http.put(url, body: jsonEncode(({})));
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCartItem(String name, String id) async {
    final requestUrl = Uri.parse('$cartUrl.json');
    try {
      await http.get(requestUrl).then((value) async {
        final returnMap = jsonDecode(value.body) as Map;
        final cartItem = returnMap.values
            .toList()
            .where((element) => element['name'] == name && element['id'] == id);

        final index = returnMap.values.toList().indexWhere(
              (element) => element['name'] == name && element['id'] == id,
            );
        final itemId = returnMap.keys.toList()[index];
        final url = Uri.parse('$cartUrl/$itemId.json');
        await http.put(url, body: jsonEncode(({})));
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadDoctorsModel(
    String firstName,
    String lastName,
    String department,
    String phoneNumber,
    String level,
    String gender,
    String emailAddress,
  ) async {
    final requestUrl = Uri.parse('$doctorsUrl.json');
    try {
      await http.post(requestUrl,
          body: jsonEncode(({
            'firstName': firstName,
            'lastName': lastName,
            'department': department,
            'phoneNumber': phoneNumber,
            'level': level,
            'gender': gender,
            'emailAddress': emailAddress,
          })));
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> getDoctorsModel() async {
    final requestUrl = Uri.parse('$doctorsUrl.json');
    var returnMap;
    try {
      await http.get(requestUrl).then((value) {
        returnMap = jsonDecode(value.body) as Map;
      });
    } catch (e) {
      rethrow;
    }
    return returnMap;
  }

  Future<void> editDoctorInfo(
    String firstName,
    String lastName,
    String department,
    String phoneNumber,
    String level,
    String id,
    String gender,
    String emailAddress,
  ) async {
    final requestUrl = Uri.parse('$doctorsUrl/$id.json');
    try {
      await http.patch(requestUrl,
          body: jsonEncode(({
            'firstName': firstName,
            'lastName': lastName,
            'department': department,
            'phoneNumber': phoneNumber,
            'level': level,
            'gender': gender,
            'emailAddress': emailAddress,
          })));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteDoctorInfo(String id) async {
    final requestUrl = Uri.parse('$doctorsUrl/$id.json');
    try {
      final searchUrl = Uri.parse('$doctorsUrl.json');
      final response = await http.get(searchUrl);
      final returnMap = jsonDecode(response.body) as Map;
      if (returnMap.keys.length == 1) {
        return;
      }
      await http.delete(requestUrl);
    } catch (e) {
      rethrow;
    }
  }
}
