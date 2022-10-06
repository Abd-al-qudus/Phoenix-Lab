import 'package:flutter/cupertino.dart';
import 'package:newapp/models/drugs.dart';

class DrugsModel with ChangeNotifier {
  final List<dynamic> overAllDrugList = [
    //antidotes
    // Drugs(
    //   name: 'acetylcysteine',
    //   description: 'so big',
    //   dosage: 'as precribed',
    //   id: 'd2',
    //   price: 11,
    //   imageUrl:
    //       'https://www.cathaydrug.com/wp-content/uploads/2016/07/FLUIMUCIL-600MG-TABLET-600x400.jpg',
    // ),
    // Drugs(
    //   name: 'calcium gluconate',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd8',
    //   price: 10,
    //   imageUrl:
    //       'https://mimsshst.blob.core.windows.net/drug-resources/TH/packshot/Calcium%20Gluconate%20GPO6001PPS0.JPG',
    // ),
    // //analgestic
    // Drugs(
    //   name: 'acetylsalicylicacid',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd3',
    //   price: 12,
    //   imageUrl: 'assets/images/pharmacy_images/acetylsalicylicacid.jpeg',
    // ),
    // Drugs(
    //   name: 'ibuprofen',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd20',
    //   price: 10,
    //   imageUrl:
    //       'https://i5.walmartimages.com/asr/d663ad9a-5c9f-49e3-badf-35002b1a6886.ca31aded4c759550bf495b7daa999bc9.jpeg',
    // ),
    // Drugs(
    //   name: 'paracetamol',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd28',
    //   price: 10,
    //   imageUrl:
    //       'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/ts/20180716102620/ri/673/picture/2018/7/shutterstock_127729928.jpg',
    // ),
    // Drugs(
    //   name: 'allopurinol',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd5',
    //   price: 7,
    //   imageUrl: 'assets/images/pharmacy_images/allopurinol.jpeg',
    // ),
    // //injectable
    // Drugs(
    //   name: 'ketamine',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd23',
    //   price: 10,
    //   imageUrl:
    //       'https://www.statnews.com/wp-content/uploads/2019/04/AP_18303533359137-768x432.jpg',
    // ),
    // Drugs(
    //   name: 'propofol',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd36',
    //   price: 10,
    //   imageUrl:
    //       'https://www.europeanpharmaceuticalreview.com/wp-content/uploads/Propofol-recall-750x500.jpg',
    // ),
    // // anti epileptic
    // Drugs(
    //   name: 'carbamazepine',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd9',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/carbamazepine.jpeg',
    // ),
    // Drugs(
    //   name: 'diazepam',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd12',
    //   price: 10,
    //   imageUrl:
    //       'https://5.imimg.com/data5/SELLER/Default/2022/4/NT/DP/FN/149478349/valium-diazepam-tablets-500x500.jpg',
    // ),
    // Drugs(
    //   name: 'phenobarbital',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd34',
    //   price: 10,
    //   imageUrl:
    //       'https://cf-s3.petcoach.co/medication_photo_medium_thumb/uploads/medication/16/1519661132-SeizureMeds.jpg',
    // ),
    //anti-infectional
    // Drugs(
    //   name: 'iodine',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd21',
    //   price: 10,
    //   imageUrl: 'https://cdn.britannica.com/68/132468-050-9DE736C3/Iodine.jpg',
    // ),
    // Drugs(
    //   name: 'mebendazole',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd25',
    //   price: 10,
    //   imageUrl:
    //       'https://wellonapharma.com/admincms/product_img/product_resize_img/Mebendazole%20Tablets_26-01-2017-13:10:49.jpg',
    // ),
    // //anti bacterial
    // Drugs(
    //   name: 'amoxicillin',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd6',
    //   price: 10,
    //   imageUrl:
    //       'https://pokupharmagh.com/wp-content/uploads/2017/07/AmoxicillinCapsules-750x688.png',
    // ),
    // Drugs(
    //   name: 'ampicillin',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd7',
    //   price: 10,
    //   imageUrl: 'http://www.shanghai-ruili.com/upload/2017428121309.JPG',
    // ),
    // Drugs(
    //   name: 'phenoxymethylpenicillin',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd35',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/phenoxymethylpenicillin.jpeg',
    // ),
    // Drugs(
    //   name: 'ciprofloxacin',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd10',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/ciprofloxacin.jpeg',
    // ),
    // Drugs(
    //   name: 'chloramphenicol',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd11',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/chloramphenicol.jpeg',
    // ),
    // Drugs(
    //   name: 'doxycycline',
    //   description: 'so big',
    //   dosage: 'as precribed',
    //   id: 'd13',
    //   price: 11,
    //   imageUrl: 'assets/images/pharmacy_images/doxycycline.jpeg',
    // ),
    // Drugs(
    //   name: 'gentamicin',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd16',
    //   price: 7,
    //   imageUrl: 'assets/images/pharmacy_images/gentamicin.jpeg',
    // ),
    // Drugs(
    //   name: 'metronidazole',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd32',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/metronidazole.jpeg',
    // ),
    // // anti leprosy
    // Drugs(
    //   name: 'ethambutol',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: '14',
    //   price: 12,
    //   imageUrl:
    //       'https://pharm.com.ng/wp-content/uploads/2019/04/ethambutol_tablets_400_mg-400x400.png',
    // ),
    // Drugs(
    //   name: 'pyrazinamide',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd37',
    //   price: 10,
    //   imageUrl:
    //       'https://mcareexports.com/wp-content/uploads/2021/04/Pzide-1000mg-tablet-600x600.jpg',
    // ),
    // //inhalational
    // Drugs(
    //   name: 'isoflurane',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd22',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/isoflurane.jpeg',
    // ),
    // Drugs(
    //   name: 'nox',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd31',
    //   price: 10,
    //   imageUrl:
    //       'https://assets.website-files.com/5f6bb9b58b09db262f667813/61537ee0c69de9da15939662_NO2_Polluiton_Hero_Adobe-Stock_Crop.jpg',
    // ),
    // Drugs(
    //   name: 'oxygen',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd29',
    //   price: 10,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Liquid_oxygen_in_a_beaker_4.jpg/150px-Liquid_oxygen_in_a_beaker_4.jpg',
    // ),
    // Drugs(
    //   name: 'halothane',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd17',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/halothane.jpeg',
    // ),
    //others
    // Drugs(
    //   name: 'methapred',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd27',
    //   price: 10,
    //   imageUrl:
    //       'https://www.jiwantahealth.com/wp-content/uploads/2020/10/jiwanta-methapred-4-1.jpg',
    // ),
    // Drugs(
    //   name: 'acetic_acid',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd1',
    //   price: 10,
    //   imageUrl:
    //       'https://media.sciencephoto.com/c0/18/00/81/c0180081-800px-wm.jpg',
    // ),
    // Drugs(
    //   name: 'fluorouracil',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: '15',
    //   price: 14,
    //   imageUrl:
    //       'https://www.highlandpethospital.net/wp-content/uploads/2019/06/fluorouracil.jpg',
    // ),
    // Drugs(
    //   name: 'pyridoxine',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd38',
    //   price: 10,
    //   imageUrl:
    //       'https://wellonapharma.com/admincms/product_img/product_resize_img/pyridoxine-tablets_1618822252.jpg',
    // ),
    // Drugs(
    //   name: 'blood_vessel2',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd39',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/blood_vessel1.jpeg',
    // ),
    // Drugs(
    //   name: 'blood_vessel1',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd40',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/blood_vessel2.jpeg',
    // ),
    // Drugs(
    //   name: 'metformin',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd26',
    //   price: 10,
    //   imageUrl:
    //       'https://post.healthline.com/wp-content/uploads/2020/06/pregnancy-metformin-is-it-safe_thumb.jpg',
    // ),
    // Drugs(
    //   name: 'omeprazole',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd30',
    //   price: 10,
    //   imageUrl:
    //       'https://bemajpharmacy.com.ng/wp-content/uploads/2019/03/OMEPRAZOLE-20MG.jpg',
    // ),
    // Drugs(
    //   name: 'hydrocortisone',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd19',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/hydrocortisone.jpeg',
    // ),
    // Drugs(
    //   name: 'lidocaine',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd24',
    //   price: 10,
    //   imageUrl: 'assets/images/pharmacy_images/lidocaine.jpeg',
    // ),
    // Drugs(
    //   name: 'hydroxychloroquine',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd18',
    //   price: 10,
    //   imageUrl:
    //       'https://www.cidrap.umn.edu/sites/default/files/styles/detail/public/media/article/hydroxychloroquine.jpg',
    // ),
    // Drugs(
    //   name: 'aciclovir',
    //   description: 'a little drug you know',
    //   dosage: 'as precribed',
    //   id: 'd4',
    //   price: 14,
    //   imageUrl: 'assets/images/pharmacy_images/aciclovir.jpeg',
    // ),
  ];
  List<Drugs> antidote = [];
  List<Drugs> antiEpileptic = [];
  List<Drugs> others = [];
  List<Drugs> inhalational = [];
  List<Drugs> antiBacterial = [];
  List<Drugs> antiInfectional = [];
  List<Drugs> injectable = [];
  List<Drugs> antiLeprosy = [];
  List<Drugs> analgestic = [];

  void addDrugs(
    Map item,
    List category,
  ) {
    for (var id in item.keys) {
      final newItem = Drugs(
          name: item[id]['name'],
          description: item[id]['description'],
          dosage: item[id]['dosage'],
          id: id,
          price: double.parse(item[id]['price']),
          imageUrl: item[id]['imageUrl']);
      category.add(newItem);
    }
  }

  void editDrugItem({
    required String id,
    required String name,
    required String dosage,
    required String description,
    required bool status,
    required double price,
    required String imageUrl,
    required List category,
  }) {
    final newItem = Drugs(
      name: name,
      description: description,
      dosage: dosage,
      id: id,
      price: price,
      imageUrl: imageUrl,
      status: status,
    );
    final index = category.indexWhere((element) => element.id == newItem.id);
    category.removeAt(index);
    category.add(newItem);
    notifyListeners();
  }

  void addNewDrug(
    String id,
    String name,
    String dosage,
    String description,
    bool status,
    double price,
    String imageUrl,
    List category,
  ) {
    final newDrug = Drugs(
        name: name,
        description: description,
        dosage: dosage,
        id: id,
        price: price,
        imageUrl: imageUrl);
    category.add(newDrug);
    notifyListeners();
  }

  void removeDrug(
    String id,
    List<Drugs> category,
  ) {
    final index = category.indexWhere((element) => element.id == id);
    category.removeAt(index);
    notifyListeners();
  }

  // String searchImageUrl(String name) {
  //   var drugItem = getDrugsList.firstWhere(
  //     (element) => element.name == name,
  //   );
  //   return drugItem.imageUrl;
  // }

}
