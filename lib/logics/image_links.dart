const Map<String, String> imageLink = {
  'clinic':
      'https://thereceptionist.com/wp-content/uploads/2018/06/featured_clinic-930x633.jpg',
  'e.n.t':
      'https://wp02-media.cdn.ihealthspot.com/wp-content/uploads/sites/494/2020/01/28223620/iStock-1072406518-1024x683.jpg',
  'cardiology':
      'https://thumbs.dreamstime.com/b/modern-medicine-cardiology-concept-doctor-stethoscope-97547910.jpg',
  'geriatrics': 'https://media.mehrnews.com/d/2019/01/28/4/3026667.jpg',
  'gastroenterology':
      'https://medicine.tulane.edu/sites/medicine.tulane.edu/files/pictures/gastroenterology300Wx176-compressor.jpg',
  'neurology':
      'https://www.topdoctors.co.uk/files/Image/large/58b0424e-411c-4243-9228-4a0725bbab96.jpg',
  'opthalmology':
      'https://thesavvyimg.co.uk/wp-content/uploads/2020/02/work-as-ophthalmologist-in-uk-as-img2-768x512.jpg',
  'orthopaedic':
      'https://aaos.net/files/aaos/splash/auto-1400-any/cao-aaos-hero-1.jpg',
  'radiology': 'https://filmdaily.co/wp-content/uploads/2021/06/rad-01.jpg',
  'gynaecology':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIyn0xO2QiZju7fUyqag3OqNYjGGGIV5Cm7g&usqp=CAU',
  'paediatrics':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpvQvAu7dnBzogAs47uiPQcVPegUZ5Ziu4fw&usqp=CAU',
  'pharmaceutical':
      'https://www.dnmu.com.ua/images/sampledata/pharmacy-dnmu-medical-university.jpeg',
  'baby_equipment3': 'assets/images/baby_equipment3.jpeg',
  'explore': 'assets/images/explore.jpg',
  // 'baby_equipment2': 'assets/images/baby_equipment2.jpg',
  'map':
      'https://i.pcmag.com/imagery/articles/01IB0rgNa4lGMBlmLyi0VP6-44.fit_lim.size_1600x900.v1643818850.jpg',
  // 'spighmanometer': 'assets/images/spighmanometer.jpeg',
  'pharmacy':
      'https://www.dnmu.com.ua/images/sampledata/pharmacy-dnmu-medical-university.jpeg',
  // 'engr_services': 'assets/images/engr_services.jpeg',
  'clinical':
      'https://thereceptionist.com/wp-content/uploads/2018/06/featured_clinic-930x633.jpg',
  'record':
      'https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_Data_Types_of_Data_and_How_To_Analyze_Data.jpg',
  // 'halothane': 'assets/images/pharmacy_images/halothane.jpeg',
  'new_item': 'assets/images/new_item.png',
  // 'lidocaine': 'assets/images/pharmacy_images/lidocaine.jpeg',
  // 'blood_vessel1': 'assets/images/pharmacy_images/blood_vessel1.jpeg',
  // 'blood_vessel2': 'assets/images/pharmacy_images/blood_vessel2.jpeg',
  // 'acetic_acid': 'assets/images/pharmacy_images/acetic acid.jpeg',
  // 'acetylcysteine': 'assets/images/pharmacy_images/acetylcysteine.jpeg',
  // 'acetylsalicylicacid':
  //     'assets/images/pharmacy_images/acetylsalicylicacid.jpeg',
  // 'aciclovir': 'assets/images/pharmacy_images/aciclovir.jpeg',
  // 'allopurinol': 'assets/images/pharmacy_images/allopurinol.jpeg',
  // 'amoxicillin': 'assets/images/pharmacy_images/amoxicillin.jpeg',
  // 'ampicillin': 'assets/images/pharmacy_images/ampicillin.jpeg',
  // 'calcium gluconate': 'assets/images/pharmacy_images/calcium gluconate.jpeg',
  // 'carbamazepine': 'assets/images/pharmacy_images/carbamazepine.jpeg',
  // 'chloramphenicol': 'assets/images/pharmacy_images/chloramphenicol.jpeg',
  // 'ciprofloxacin': 'assets/images/pharmacy_images/ciprofloxacin.jpeg',
  // 'diazepam': 'assets/images/pharmacy_images/diazepam.jpeg',
  // 'doxycycline': 'assets/images/pharmacy_images/doxycycline.jpeg',
  // 'ethambutol': 'assets/images/pharmacy_images/ethambutol.jpeg',
  // 'fluorouracil': 'assets/images/pharmacy_images/fluorouracil.jpeg',
  // 'gentamicin': 'assets/images/pharmacy_images/gentamicin.jpeg',
  // 'hydrocortisone': 'assets/images/pharmacy_images/hydrocortisone.jpeg',
  // 'hydroxychloroquine': 'assets/images/pharmacy_images/hydroxychloroquine.jpeg',
  // 'ibuprofen': 'assets/images/pharmacy_images/ibuprofen.jpeg',
  // 'iodine': 'assets/images/pharmacy_images/iodine.jpeg',
  // 'isoflurane': 'assets/images/pharmacy_images/isoflurane.jpeg',
  // 'ketamine': 'assets/images/pharmacy_images/ketamine.jpeg',
  // 'mebendazole': 'assets/images/pharmacy_images/mebendazole.jpeg',
  // 'metformin': 'assets/images/pharmacy_images/metformin.jpeg',
  // 'methapred': 'assets/images/pharmacy_images/methapred.jpeg',
  // 'metronidazole': 'assets/images/pharmacy_images/metronidazole.jpeg',
  // 'nox': 'assets/images/pharmacy_images/nox.jpeg',
  // 'omeprazole': 'assets/images/pharmacy_images/omeprazole.jpeg',
  // 'oxygen': 'assets/images/pharmacy_images/oxygen.jpeg',
  // 'paracetamol': 'assets/images/pharmacy_images/paracetamol.jpeg',
  // 'penicillamine': 'assets/images/pharmacy_images/penicillamine.jpeg',
  // 'phenobarbital': 'assets/images/pharmacy_images/phenobarbital.jpeg',
  // 'phenoxymethylpenicillin':
  //     'assets/images/pharmacy_images/phenoxymethylpenicillin.jpeg',
  // 'propofol': 'assets/images/pharmacy_images/propofol.jpeg',
  // 'pyrazinamide': 'assets/images/pharmacy_images/pyrazinamide.jpeg',
  // 'pyridoxine': 'assets/images/pharmacy_images/pyridoxine.jpeg',
};

String returnImageUrl(String name) {
  String returnType = imageLink[name]!;
  return returnType;
}
