var getInt = {
  'meter': 0,
  'kilometer': 1,
  'mile': 2,
  'yard': 3,
  'feet': 4,
  'inch': 5,
};

final Map<String, List> converter = {
  'meter': [1.0, 0.001, 621.37, 1.0936, 3.2808, 40.0],
  'kilometer': [1000.0, 1.0, 0.6214, 1093.6, 0.0033, 0.04],
  'mile': [1609.3, 1.6093, 1.0, 1759.93, 5279.79, 64372],
  'yard': [0.9144, 0.00091, 0.00057, 1.0, 3.0, 36.576],
  'feet': [0.3048, 0.000305, 5279.86, 1.0, 12.192],
  'inch': [0.025, 0.000025, 0.00000155, 0.027, 0.082, 1.0],
};

final List<String> selections = [
  'meter',
  'kilometer',
  'mile',
  'yard',
  'feet',
  'inch'
];
