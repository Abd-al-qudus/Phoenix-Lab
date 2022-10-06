import 'package:flutter/material.dart';
import '../models/drugs.dart';
import '../models/drugs_provider.dart';
import '../models/http_provider.dart';
import '../screens/edit_drug_screen.dart';
import '../widgets/build_home_screen_cards.dart';
import 'package:provider/provider.dart';

import '../screens/add_drug_screen.dart';
import '../screens/pharmacy_drug_detail_screen.dart';

class BuildDrugCategories extends StatefulWidget {
  final List<Drugs> buildItems;
  final String category;
  const BuildDrugCategories({
    Key? key,
    required this.buildItems,
    required this.category,
  }) : super(key: key);

  @override
  State<BuildDrugCategories> createState() => _BuildDrugCategoriesState();
}

class _BuildDrugCategoriesState extends State<BuildDrugCategories> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final httpRequest = HttpRequests();
    final drugProvider = Provider.of<DrugsModel>(context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 2 / 2,
            ),
            itemBuilder: (context, index) => Stack(
              children: [
                HomeScreenSmallCards(
                  height: double.infinity,
                  onPressed: () => Navigator.of(context).pushNamed(
                    DrugOverviewScreen.routeName,
                    arguments: {
                      'id': widget.buildItems[index].id,
                      'name': widget.buildItems[index].name,
                      'description': widget.buildItems[index].description,
                      'dosage': widget.buildItems[index].dosage,
                      'price': widget.buildItems[index].price,
                      'imageUrl': widget.buildItems[index].imageUrl,
                      'status': widget.buildItems[index].status,
                    },
                  ),
                  title: widget.buildItems[index].name,
                  width: double.infinity,
                  imageUrl: widget.buildItems[index].imageUrl,
                  fontSize: 15,
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
                                  'category': widget.category,
                                  'id': widget.buildItems[index].id,
                                  'name': widget.buildItems[index].name,
                                  'description':
                                      widget.buildItems[index].description,
                                  'dosage': widget.buildItems[index].dosage,
                                  'price': widget.buildItems[index].price,
                                  'imageUrl': widget.buildItems[index].imageUrl,
                                  'status': widget.buildItems[index].status,
                                },
                              );
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
                                'category': widget.category,
                              },
                            );
                          },
                        ),
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
                                content: const Text('delete this item?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('NO'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      List<Drugs> drug;
                                      if (widget.category == 'analgestic') {
                                        drug = drugProvider.analgestic;
                                      } else if (widget.category ==
                                          'antidote') {
                                        drug = drugProvider.antidote;
                                      } else if (widget.category ==
                                          'anti-leprosy') {
                                        drug = drugProvider.antiLeprosy;
                                      } else if (widget.category ==
                                          'anti-bacterial') {
                                        drug = drugProvider.antiBacterial;
                                      } else if (widget.category ==
                                          'antiepileptic') {
                                        drug = drugProvider.antiEpileptic;
                                      } else if (widget.category ==
                                          'anti-infectional') {
                                        drug = drugProvider.antiInfectional;
                                      } else {
                                        drug = drugProvider.injectable;
                                      }
                                      await httpRequest
                                          .deleteProduct(
                                              drug[index].id, widget.category)
                                          .then((response) {
                                        Navigator.of(context).pop();
                                        if (response ==
                                            httpRequest.successCode) {
                                          drugProvider.removeDrug(
                                              widget.buildItems[index].id,
                                              drug);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('item removed'),
                                            ),
                                          );
                                          setState(() {
                                            isLoading = false;
                                          });
                                        } else {
                                          setState(() {
                                            isLoading = false;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(response),
                                              ),
                                            );
                                          });
                                        }
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
                widget.buildItems[index].status
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
            itemCount: widget.buildItems.length,
          );
  }
}
