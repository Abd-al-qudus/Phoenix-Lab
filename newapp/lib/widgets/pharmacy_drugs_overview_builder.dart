import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drugs_provider.dart';
import '../models/http_provider.dart';
import '../screens/add_drug_screen.dart';
import '../screens/edit_drug_screen.dart';
import '../screens/pharmacy_drug_categories/analgestic_screen.dart';
import '../screens/pharmacy_drug_categories/anti_bacterial.dart';
import '../screens/pharmacy_drug_categories/anti_epileptic_screen.dart';
import '../screens/pharmacy_drug_categories/anti_infectional_screen.dart';
import '../screens/pharmacy_drug_categories/anti_leprosy_screen.dart';
import '../screens/pharmacy_drug_categories/antidote_screen.dart';
import '../screens/pharmacy_drug_categories/injectable_screen.dart';
import '../screens/pharmacy_drug_detail_screen.dart';
import '../screens/pharmacy_search_screen.dart';
import '../widgets/build_home_screen_cards.dart';
import '../widgets/build_large_container.dart';

class PharmacyDrugOveriviewBuilder extends StatefulWidget {
  const PharmacyDrugOveriviewBuilder({Key? key}) : super(key: key);

  @override
  State<PharmacyDrugOveriviewBuilder> createState() =>
      _PharmacyDrugOveriviewBuilderState();
}

class _PharmacyDrugOveriviewBuilderState
    extends State<PharmacyDrugOveriviewBuilder> {
  final httpRequest = HttpRequests();
  final searchText = TextEditingController();
  late Future _products;
  @override
  void initState() {
    _products = httpRequest.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drugProvider = Provider.of<DrugsModel>(context);
    final mediaQueryData = MediaQuery.of(context).size;
    final screenWidth = mediaQueryData.width;
    final screenHeight = mediaQueryData.height;

    return FutureBuilder(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final Map products = snapshot.data as Map;
          final analgestic = products['analgestic'];
          final inhalational = products['inhalational'];
          final injectable = products['injectable'];
          final antiEpileptic = products['antiepileptic'];
          final antibacterial = products['anti-bacterial'];
          final antiLeprosy = products['anti-leprosy'];
          final antiInfectional = products['anti-infectional'];
          final antidote = products['antidote'];
          final others = products['others'];
          if (drugProvider.analgestic.isEmpty &&
              drugProvider.inhalational.isEmpty &&
              drugProvider.injectable.isEmpty &&
              drugProvider.antiEpileptic.isEmpty &&
              drugProvider.antiBacterial.isEmpty &&
              drugProvider.antiLeprosy.isEmpty &&
              drugProvider.antiInfectional.isEmpty &&
              drugProvider.antidote.isEmpty &&
              drugProvider.others.isEmpty) {
            drugProvider.addDrugs(analgestic, drugProvider.analgestic);
            drugProvider.addDrugs(inhalational, drugProvider.inhalational);
            drugProvider.addDrugs(injectable, drugProvider.injectable);
            drugProvider.addDrugs(antiEpileptic, drugProvider.antiEpileptic);
            drugProvider.addDrugs(antibacterial, drugProvider.antiBacterial);
            drugProvider.addDrugs(antiLeprosy, drugProvider.antiLeprosy);
            drugProvider.addDrugs(
                antiInfectional, drugProvider.antiInfectional);
            drugProvider.addDrugs(antidote, drugProvider.antidote);
            drugProvider.addDrugs(others, drugProvider.others);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Theme.of(context).canvasColor,
                child: TextFormField(
                  controller: searchText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter a keyword';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        final result = [];
                        for (var e in analgestic.keys) {
                          result.add(analgestic[e]);
                        }
                        for (var e in antidote.keys) {
                          result.add(antidote[e]);
                        }
                        for (var e in antiInfectional.keys) {
                          result.add(antiInfectional[e]);
                        }
                        for (var e in antiLeprosy.keys) {
                          result.add(antiLeprosy[e]);
                        }
                        for (var e in antibacterial.keys) {
                          result.add(antibacterial[e]);
                        }
                        for (var e in others.keys) {
                          result.add(others[e]);
                        }
                        for (var e in antiEpileptic.keys) {
                          result.add(antiEpileptic[e]);
                        }
                        for (var e in injectable.keys) {
                          result.add(injectable[e]);
                        }
                        for (var e in inhalational.keys) {
                          result.add(inhalational[e]);
                        }

                        final searchedElementList = result
                            .where(
                              (element) =>
                                  element['name'].contains(searchText.text),
                            )
                            .toList();
                        // print(products.values.toList());
                        Navigator.of(context).pushNamed(
                          PharmacySearchScreen.routeName,
                          arguments: searchedElementList,
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'consumables',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.15,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 2 / 2,
                    ),
                    itemBuilder: (BuildContext context, int index) => Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        HomeScreenSmallCards(
                          height: screenHeight * 0.15,
                          onPressed: () => Navigator.of(context).pushNamed(
                              DrugOverviewScreen.routeName,
                              arguments: {
                                'id': others.keys.toList()[index],
                                'name': others.values.toList()[index]['name'],
                                'description': others.values.toList()[index]
                                    ['description'],
                                'dosage': others.values.toList()[index]
                                    ['dosage'],
                                'price': others.values.toList()[index]['price'],
                                'imageUrl': others.values.toList()[index]
                                    ['imageUrl'],
                                'status': others.values.toList()[index]
                                    ['status'],
                              }),
                          title: others.values.toList()[index]['name'],
                          width: screenWidth,
                          imageUrl: others.values.toList()[index]['imageUrl'],
                          fontSize: 10,
                          child: PopupMenuButton(
                            iconSize: 15,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushNamed(
                                        EditDrugScreen.routeName,
                                        arguments: {
                                          'category': 'others',
                                          'id': others.keys.toList()[index],
                                          'name': others.values.toList()[index]
                                              ['name'],
                                          'description': others.values
                                              .toList()[index]['description'],
                                          'dosage': others.values
                                              .toList()[index]['dosage'],
                                          'price': others.values.toList()[index]
                                              ['price'],
                                          'imageUrl': others.values
                                              .toList()[index]['imageUrl'],
                                          'status': others.values
                                              .toList()[index]['status'],
                                        },
                                      ).then((value) {
                                        if (value != null) {
                                          setState(() {
                                            _products =
                                                httpRequest.getAllProducts();
                                          });
                                        }
                                        return;
                                      });
                                    },
                                    child: const Text('Edit this')),
                              ),
                              PopupMenuItem(
                                child: GestureDetector(
                                    child: const Text('Add new'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushNamed(
                                          AddDrugScreen.routeName,
                                          arguments: {
                                            'category': 'others'
                                          }).then((value) {
                                        if (value != null) {
                                          setState(() {
                                            _products =
                                                httpRequest.getAllProducts();
                                          });
                                        }
                                        return;
                                      });
                                    }),
                              ),
                              PopupMenuItem(
                                child: GestureDetector(
                                  child: const Text('Delete'),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actionsAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        title: const Text('confirm action'),
                                        content:
                                            const Text('delete this item?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text('NO'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await httpRequest
                                                  .deleteProduct(
                                                      others.keys
                                                          .toList()[index],
                                                      'others')
                                                  .then((value) {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  _products = httpRequest
                                                      .getAllProducts();
                                                });
                                              });
                                            },
                                            child: const Text('YES'),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        others.values.toList()[index]['status']
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.accessible,
                                  size: 20,
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.not_accessible,
                                  size: 20,
                                ),
                              ),
                      ],
                    ),
                    itemCount: others.keys.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'categories',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.4,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: BuildLargeContainer(
                        height: screenHeight * 0.4,
                        width: screenWidth * 0.45,
                        onPressed: () => Navigator.of(context).pushNamed(
                          AntidoteScreen.routeName,
                        ),
                        title: 'ANTIDOTES',
                        imageUrl: antidote.values.first['imageUrl'],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: HomeScreenSmallCards(
                            height: screenHeight * 0.2,
                            onPressed: () => Navigator.of(context).pushNamed(
                              AnalgesticScreen.routeName,
                            ),
                            title: 'ANALGESTICS',
                            width: screenWidth * 0.45,
                            imageUrl: analgestic.values.first['imageUrl'],
                            child: const SizedBox(),
                          ),
                        ),
                        Expanded(
                          child: HomeScreenSmallCards(
                            height: screenHeight * 0.2,
                            onPressed: () => Navigator.of(context).pushNamed(
                              InjectableScreen.routeName,
                            ),
                            title: 'INJECTABLE',
                            width: screenWidth * 0.45,
                            imageUrl: injectable.values.first['imageUrl'],
                            child: const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.25,
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: HomeScreenSmallCards(
                        height: double.infinity,
                        onPressed: () => Navigator.of(context).pushNamed(
                          AntiLeprosyScreen.routeName,
                        ),
                        title: 'ANTI-LEPROSY',
                        width: double.infinity,
                        imageUrl: antiLeprosy.values.first['imageUrl'],
                        child: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: HomeScreenSmallCards(
                        height: double.infinity,
                        onPressed: () => Navigator.of(context).pushNamed(
                          AntiEpilepticScreen.routeName,
                        ),
                        title: 'ANTIEPILEPTICS',
                        width: double.infinity,
                        imageUrl: antiEpileptic.values.first['imageUrl'],
                        child: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.25,
                width: screenWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: HomeScreenSmallCards(
                        height: double.infinity,
                        onPressed: () => Navigator.of(context).pushNamed(
                          AntiInfectionalScreen.routeName,
                        ),
                        title: 'ANTI-INFECTIONAL',
                        width: double.infinity,
                        imageUrl: antiInfectional.values.first['imageUrl'],
                        child: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: HomeScreenSmallCards(
                        height: double.infinity,
                        onPressed: () => Navigator.of(context).pushNamed(
                          AntiBacterialScreen.routeName,
                        ),
                        title: 'ANTI-BACTERIAL',
                        width: double.infinity,
                        imageUrl: antibacterial.values.first['imageUrl'],
                        child: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'others',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 5.5 / 5,
                      ),
                      itemBuilder: (BuildContext context, int index) => Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          HomeScreenSmallCards(
                            height: screenHeight * 0.3,
                            onPressed: () => Navigator.of(context).pushNamed(
                                DrugOverviewScreen.routeName,
                                arguments: {
                                  'id': inhalational.keys.toList()[index],
                                  'name': inhalational.values.toList()[index]
                                      ['name'],
                                  'description': inhalational.values
                                      .toList()[index]['description'],
                                  'dosage': inhalational.values.toList()[index]
                                      ['dosage'],
                                  'price': inhalational.values.toList()[index]
                                      ['price'],
                                  'imageUrl': inhalational.values
                                      .toList()[index]['imageUrl'],
                                  'status': inhalational.values.toList()[index]
                                      ['status'],
                                }),
                            title: inhalational.values.toList()[index]['name'],
                            width: double.infinity,
                            imageUrl: inhalational.values.toList()[index]
                                ['imageUrl'],
                            fontSize: 12,
                            child: PopupMenuButton(
                              iconSize: 15,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pushNamed(
                                            EditDrugScreen.routeName,
                                            arguments: {
                                              'category': 'inhalational',
                                              'id': inhalational.keys
                                                  .toList()[index],
                                              'name': inhalational.values
                                                  .toList()[index]['name'],
                                              'description': inhalational.values
                                                      .toList()[index]
                                                  ['description'],
                                              'dosage': inhalational.values
                                                  .toList()[index]['dosage'],
                                              'price': inhalational.values
                                                  .toList()[index]['price'],
                                              'imageUrl': inhalational.values
                                                  .toList()[index]['imageUrl'],
                                              'status': inhalational.values
                                                  .toList()[index]['status'],
                                            },
                                          ).then((value) {
                                            if (value != null) {
                                              setState(() {
                                                _products = httpRequest
                                                    .getAllProducts();
                                              });
                                            }
                                            return;
                                          });
                                        },
                                        child: const Text('Edit this'))),
                                PopupMenuItem(
                                  child: GestureDetector(
                                      child: const Text('Add new'),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushNamed(
                                            AddDrugScreen.routeName,
                                            arguments: {
                                              'category': 'inhalational',
                                            }).then((value) {
                                          if (value != null) {
                                            setState(() {
                                              _products =
                                                  httpRequest.getAllProducts();
                                            });
                                          }
                                        });
                                      }),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    child: const Text('Delete'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          actionsAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          title: const Text('confirm action'),
                                          content:
                                              const Text('delete this item?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text('NO'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await httpRequest
                                                    .deleteProduct(
                                                        inhalational.keys
                                                            .toList()[index],
                                                        'inhalational')
                                                    .then(
                                                  (value) {
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      _products = httpRequest
                                                          .getAllProducts();
                                                    });
                                                  },
                                                );
                                              },
                                              child: const Text('YES'),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          inhalational.values.toList()[index]['status']
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.accessible,
                                    size: 20,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.not_accessible,
                                    size: 20,
                                  ),
                                ),
                        ],
                      ),
                      itemCount: products['inhalational'].keys.length,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
