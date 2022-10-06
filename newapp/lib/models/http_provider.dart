import 'dart:convert';
import 'package:http/http.dart' as http;

const staticUrl = 'https://flutter-pharmacy-app-default-rtdb.firebaseio.com';
const recordUrl = '$staticUrl/records';
const productUrl = '$staticUrl/products';
const productListUrl = '$staticUrl/url.json';
const cartUrl = '$staticUrl/cart';
const doctorsUrl = '$staticUrl/doctors';

class HttpRequests {
  final String successCode = 'success';
  final String failureCode = 'connection failed';

  Future getUrlList() async {
    List<Map<dynamic, dynamic>> urlList = [];
    final url = Uri.parse(productListUrl);
    try {
      return await http.get(url).then((response) {
        if (response.statusCode <= 400) {
          final Map<dynamic, dynamic> urlMap = jsonDecode(response.body);
          for (var element in urlMap.values) {
            urlList.add(element);
          }
          return urlList;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future createProductCategory(
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
      return await http
          .post(requestUrl,
              body: json.encode(({
                'name': name,
                'dosage': dosage,
                'description': description,
                'price': price,
                'imageUrl': imageUrl,
              })))
          .then((response) async {
        if (response.statusCode < 400) {
          final url = Uri.parse(productListUrl);
          return await http
              .post(url,
                  body: json.encode(
                      ({categoryName: '$productUrl/$categoryName.json'})))
              .then((returnValue) {
            if (returnValue.statusCode < 400) {
              return successCode;
            } else {
              return failureCode;
            }
          });
        } else {
          return response.body;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future getAllProducts() async {
    Map<dynamic, dynamic> products = {};
    final url = Uri.parse('$productUrl.json');
    try {
      return await http.get(url).then((response) {
        if (response.statusCode < 400) {
          products = jsonDecode(response.body);
          return products;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  // Future getproductCategory(String productName) async {
  //   final Map response = {};
  //   final String requestUrl = '$productUrl/$productName.json';
  //   final url = Uri.parse(requestUrl);
  //   try {
  //     final responseMap = await http.get(url);
  //     final Map<dynamic, dynamic> responseJson = jsonDecode(responseMap.body);
  //     response.addAll(responseJson);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return response;
  // }

  // Future<void> deleteProductCategory(String productCategory) async {
  //   final url = Uri.parse('$productUrl/$productCategory.json');
  //   try {
  //     final response = await http.put(url, body: jsonEncode(({})));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future addProducts(
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
      return await http
          .post(requestUrl,
              body: json.encode(({
                'name': name,
                'dosage': dosage,
                'description': description,
                'price': price,
                'imageUrl': imageUrl,
                'status': availability,
              })))
          .then((response) {
        if (response.statusCode < 400) {
          return response.body;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future editProducts(
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
      return await http
          .patch(requestUrl,
              body: json.encode(({
                'name': name,
                'dosage': dosage,
                'description': description,
                'price': price,
                'imageUrl': imageUrl,
                'status': availability,
              })))
          .then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future deleteProduct(String id, String category) async {
    final editUrl = '$staticUrl/products/$category/$id.json';
    final requestUrl = Uri.parse(editUrl);
    try {
      return await http
          .delete(requestUrl, body: jsonEncode(({})))
          .then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future addRecord(Map<dynamic, dynamic> records) async {
    final requestUrl = Uri.parse('$recordUrl.json');
    try {
      return await http
          .post(requestUrl, body: jsonEncode((records)))
          .then((response) {
        if (response.statusCode < 400) {
          final recordId = jsonDecode(response.body) as Map;
          return recordId;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future getRecord(String id) async {
    Map<dynamic, dynamic> record = {};
    final requestUrl = Uri.parse('$recordUrl/$id.json');
    try {
      return await http.get(requestUrl).then((response) {
        if (response.statusCode < 400) {
          final Map<dynamic, dynamic> recordJson = jsonDecode(response.body);
          record.addAll(recordJson);
          return record;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future editRecord(String id, Map<dynamic, dynamic> records) async {
    final requestUrl = Uri.parse('$recordUrl/$id.json');
    try {
      return await http
          .patch(requestUrl, body: jsonEncode((records)))
          .then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future deleteRecord(String id) async {
    final requestUrl = Uri.parse('$recordUrl/$id.json');
    try {
      return await http
          .delete(requestUrl, body: jsonEncode(({})))
          .then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  // Future<void> uploadImage(Map<dynamic, dynamic> imageMap) async {
  //   final requestUrl = Uri.parse('$staticUrl/images.json');
  //   try {
  //     await http.post(requestUrl, body: jsonEncode((imageMap)));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future getUploadedImage() async {
    final requestUrl = Uri.parse('$staticUrl/images.json');
    try {
      var imageMap = {};
      return await http.get(requestUrl).then((response) {
        if (response.statusCode < 400) {
          imageMap = jsonDecode(response.body) as Map;
          return imageMap;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future uploadCartItem(
    String name,
    double price,
    int count,
    String id,
  ) async {
    final uploadUrl = Uri.parse('$cartUrl.json');
    try {
      return await http.get(uploadUrl).then((response) async {
        if (response.statusCode < 400) {
          if (jsonDecode(response.body) == null) {
            return await http
                .post(uploadUrl,
                    body: jsonEncode(({
                      'name': name,
                      'price': price,
                      'count': count,
                      'id': id,
                    })))
                .then((response) {
              if (response.statusCode < 400) {
                return successCode;
              } else {
                return failureCode;
              }
            });
          } else {
            final Map returnMap = jsonDecode(response.body) as Map;
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

              return await http
                  .patch(requestUrl,
                      body: jsonEncode(({
                        'name': itemMap[0]['name'],
                        'id': itemMap[0]['id'],
                        'count': itemMap[0]['count'] + 1,
                        'price': itemMap[0]['price'],
                      })))
                  .then((response) {
                if (response.statusCode < 400) {
                  return successCode;
                } else {
                  return failureCode;
                }
              });
            } else {
              if (itemMap.isEmpty) {
                return await http
                    .post(uploadUrl,
                        body: jsonEncode(({
                          'name': name,
                          'price': price,
                          'count': count,
                          'id': id,
                        })))
                    .then((response) {
                  if (response.statusCode < 400) {
                    return successCode;
                  } else {
                    return failureCode;
                  }
                });
              }
            }
          }
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future reduceCartItem(
    String id,
    String name,
  ) async {
    final requestUrl = Uri.parse('$cartUrl.json');
    try {
      return await http.get(requestUrl).then((response) async {
        if (response.statusCode < 400) {
          final returnMap = jsonDecode(response.body) as Map;
          final cartItem = returnMap.values
              .toList()
              .where(
                  (element) => element['name'] == name && element['id'] == id)
              .toList();
          final index = returnMap.values.toList().indexWhere(
                (element) => element['name'] == name && element['id'] == id,
              );
          final itemId = returnMap.keys.toList()[index];
          if (cartItem[0]['count'] > 1) {
            final url = Uri.parse('$cartUrl/$itemId.json');
            return await http
                .patch(url,
                    body: jsonEncode(({
                      'name': cartItem[0]['name'],
                      'id': cartItem[0]['id'],
                      'count': cartItem[0]['count'] - 1,
                      'price': cartItem[0]['price'],
                    })))
                .then((response) {
              if (response.statusCode < 400) {
                return successCode;
              } else {
                return failureCode;
              }
            });
          } else {
            final url = Uri.parse('$cartUrl/$itemId.json');
            return await http.delete(url).then((response) {
              if (response.statusCode < 400) {
                return successCode;
              } else {
                return failureCode;
              }
            });
          }
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future removeCartItem(String name, String id) async {
    final requestUrl = Uri.parse('$cartUrl.json');
    try {
      return await http.get(requestUrl).then((response) async {
        if (response.statusCode < 400) {
          final returnMap = jsonDecode(response.body) as Map;
          final index = returnMap.values.toList().indexWhere(
                (element) => element['name'] == name && element['id'] == id,
              );
          final itemId = returnMap.keys.toList()[index];
          final url = Uri.parse('$cartUrl/$itemId.json');
          return await http.delete(url).then((response) {
            if (response.statusCode < 400) {
              return successCode;
            } else {
              return failureCode;
            }
          });
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future uploadDoctorsModel(
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
      return await http
          .post(requestUrl,
              body: jsonEncode(({
                'firstName': firstName,
                'lastName': lastName,
                'department': department,
                'phoneNumber': phoneNumber,
                'level': level,
                'gender': gender,
                'emailAddress': emailAddress,
              })))
          .then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future getDoctorsModel() async {
    final requestUrl = Uri.parse('$doctorsUrl.json');
    var returnMap = {};
    try {
      return await http.get(requestUrl).then((response) {
        if (response.statusCode < 400) {
          returnMap = jsonDecode(response.body) as Map;
          return returnMap;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future editDoctorInfo(
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
      return await http
          .patch(requestUrl,
              body: jsonEncode(({
                'firstName': firstName,
                'lastName': lastName,
                'department': department,
                'phoneNumber': phoneNumber,
                'level': level,
                'gender': gender,
                'emailAddress': emailAddress,
              })))
          .then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }

  Future deleteDoctorInfo(String id) async {
    final requestUrl = Uri.parse('$doctorsUrl/$id.json');
    try {
      final searchUrl = Uri.parse('$doctorsUrl.json');
      final response = await http.get(searchUrl);
      final returnMap = jsonDecode(response.body) as Map;
      if (returnMap.keys.length == 1) {
        return;
      }
      return await http.delete(requestUrl).then((response) {
        if (response.statusCode < 400) {
          return successCode;
        } else {
          return failureCode;
        }
      });
    } catch (e) {
      return e;
    }
  }
}
