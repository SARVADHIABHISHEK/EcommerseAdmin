import 'dart:math';
import 'package:ecommerse_admin/src/admin/constant/color.dart';
import 'package:ecommerse_admin/src/admin/constant/icons.dart';
import 'package:ecommerse_admin/src/admin/constant/string.dart';
import 'package:ecommerse_admin/src/admin/constant/theme.dart';
import 'package:ecommerse_admin/src/admin/utils/localizaion/multi_language.dart';
import 'package:ecommerse_admin/src/admin/view/products/product.dart';
import 'package:ecommerse_admin/src/admin/widget/datatable.dart';
import 'package:ecommerse_admin/src/admin/widget/svg_icon.dart';
import 'package:ecommerse_admin/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class OfferOnBrands extends StatefulWidget {
  const OfferOnBrands({super.key});

  @override
  State<OfferOnBrands> createState() => _OfferOnBrandsState();
}

class _OfferOnBrandsState extends State<OfferOnBrands> {
  // final FormUploadFileBloc _formUploadFileBloc = FormUploadFileBloc();
  // late DropzoneViewController _controller;
  // final List<XFile> _filesList = [];
  bool isExcelFile = false;
  Uint8List bytes = Uint8List(0);

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _expriryDate = TextEditingController();
  final TextEditingController _offerController = TextEditingController();
  final ValueNotifier<String> _categorySelected = ValueNotifier('');

  final List<ProductModel> _productItem = [
    ProductModel(
      id: 1,
      offerInPercentage: 10,
      category: 'mobile',
      expiryDate: '02/10/2024',
    ),
    ProductModel(
      id: 2,
      offerInPercentage: 10,
      category: 'mobile',
      expiryDate: '02/10/2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FxButton(
            onPressed: () {
              FxModal.showModel(
                context: context,
                title: languageModel.eCommerceAdmin.productAdd.trim(),
                content: _productForm(),
                trailingIcon: const SvgIcon(icon: IconlyBroken.closeSquare),
                actions: [
                  FxButton(
                    onPressed: () => Navigator.pop(context),
                    text: Strings.close,
                    buttonType: ButtonType.secondary,
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: _categorySelected,
                    builder: (context, value, child) {
                      return FxButton(
                        onPressed: () {
                          Navigator.pop(context);

                          setState(
                            () {
                              _productItem.add(
                                ProductModel(
                                  id: 3,
                                  offerInPercentage: int.parse(
                                    _offerController.text,
                                  ),
                                  category: value,
                                  expiryDate: _expriryDate.text,
                                ),
                              );

                              _productName.clear();
                              _offerController.clear();
                            },
                          );
                        },
                        text: Strings.saveChange,
                      );
                    },
                  ),
                ],
                modelType: ModalType.normal,
              );
            },
            icon: const Icon(Icons.add),
            text: 'Add New Brand',
            borderRadius: 4.0,
          ),
          FxBox.h10,
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: DataTable3(
              minWidth: 1100,
              columns: _productColum(),
              rows: _productRow(),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _productColum() {
    List<String> column = [
      languageModel.eCommerceAdmin.id,
      'OffersInPercentage',
      'Category Name',
      languageModel.eCommerceAdmin.expiryDate,
      '',
    ];
    return [
      for (int i = 0; i < column.length; i++) ...[
        DataColumn(
          label: Text(
            column[i],
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ]
    ];
  }

  List<DataRow2> _productRow() {
    return [
      for (int i = 0; i < _productItem.length; i++) ...[
        DataRow2(
          cells: [
            DataCell(Text(_productItem[i].id.toString())),
            DataCell(Text("${_productItem[i].offerInPercentage}%")),
            DataCell(Text(_productItem[i].category)),
            DataCell(Text(_productItem[i].expiryDate)),
            DataCell(
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _productItem.removeWhere(
                            (element) => element.id == _productItem[i].id);
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ]
    ];
  }

  Widget _productForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _formTitle("Add Offers"),
        FxBox.h6,
        CustomTextField(
          controller: _offerController,
          contentPadding: const EdgeInsets.all(12.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        FxBox.h6,
        _formTitle('Select Category'),
        FxBox.h6,
        _categoryDropDown(),
        FxBox.h16,
        _expiryRow(),
      ],
    );
  }

  Widget _categoryDropDown() {
    return DropdownButtonFormField(
      hint: const Text(
        'Select Category',
        style: TextStyle(
          color: ColorConst.black,
        ),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: !isDark
                ? ColorConst.black
                : ColorConst.white.withOpacity(
                    0.5,
                  ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:
                !isDark ? ColorConst.black : ColorConst.white.withOpacity(0.5),
          ),
        ),
      ),
      onChanged: (value) {
        _categorySelected.value = value['category'];
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        _categorySelected.notifyListeners();
      },
      items: productList.map<DropdownMenuItem>(
        (e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e['category'].toString()),
          );
        },
      ).toList(),
    );
  }

  Widget _expiryRow() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formTitle(languageModel.eCommerceAdmin.expiryDate),
              FxBox.h6,
              CustomTextField(
                controller: _expriryDate,
                keyboardType: TextInputType.datetime,
                contentPadding: const EdgeInsets.all(12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  CustomDateTextFormatter(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

_formTitle(String text) {
  return Text(
    text,
    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
  );
}

//

class ProductModel {
  int id;
  int offerInPercentage;
  String category;
  String expiryDate;

  ProductModel({
    required this.id,
    required this.offerInPercentage,
    required this.category,
    required this.expiryDate,
  });
}

class CustomDateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/', oldValue);
    return newValue.copyWith(
        text: text, selection: _updateCursorPosition(text, oldValue));
  }
}

String _format(String value, String seperator, TextEditingValue old) {
  var finalString = '';
  var dd = '';
  var mm = '';
  var yyy = '';
  var oldVal = old.text;

  var tempOldval = oldVal;
  var tempValue = value;
  if (!oldVal.contains(seperator) ||
      oldVal.isEmpty ||
      seperator.allMatches(oldVal).length < 2) {
    oldVal += '///';
  }
  if (!value.contains(seperator) || _backSlashCount(value) < 2) {
    value += '///';
  }
  var splitArrOLD = oldVal.split(seperator);
  var splitArrNEW = value.split(seperator);

  for (var i = 0; i < 3; i++) {
    splitArrOLD[i] = splitArrOLD[i].toString().trim();
    splitArrNEW[i] = splitArrNEW[i].toString().trim();
  }
  // block erasing
  if ((splitArrOLD[0].isNotEmpty &&
          splitArrOLD[2].isNotEmpty &&
          splitArrOLD[1].isEmpty &&
          tempValue.length < tempOldval.length &&
          splitArrOLD[0] == splitArrNEW[0] &&
          splitArrOLD[2].toString().trim() ==
              splitArrNEW[1].toString().trim()) ||
      (_backSlashCount(tempOldval) > _backSlashCount(tempValue) &&
          splitArrNEW[1].length > 2) ||
      (splitArrNEW[0].length > 2 && _backSlashCount(tempOldval) == 1) ||
      (_backSlashCount(tempOldval) == 2 &&
          _backSlashCount(tempValue) == 1 &&
          splitArrNEW[0].length > splitArrOLD[0].length)) {
    finalString = tempOldval; // making the old date as it is
  } else {
    if (splitArrNEW[0].length > splitArrOLD[0].length) {
      if (splitArrNEW[0].length < 3) {
        dd = splitArrNEW[0];
      } else {
        for (var i = 0; i < 2; i++) {
          dd += splitArrNEW[0][i];
        }
      }
      if (dd.length == 2 && !dd.contains(seperator)) {
        dd += seperator;
      }
    } else if (splitArrNEW[0].length == splitArrOLD[0].length) {
      if (oldVal.length > value.length && splitArrNEW[1].isEmpty) {
        dd = splitArrNEW[0];
      } else {
        dd = splitArrNEW[0] + seperator;
      }
    } else if (splitArrNEW[0].length < splitArrOLD[0].length) {
      if (oldVal.length > value.length &&
          splitArrNEW[1].isEmpty &&
          splitArrNEW[0].isNotEmpty) {
        dd = splitArrNEW[0];
      } else if (tempOldval.length > tempValue.length &&
          splitArrNEW[0].isEmpty &&
          _backSlashCount(tempValue) == 2) {
        dd += seperator;
      } else {
        if (splitArrNEW[0].isNotEmpty) {
          dd = splitArrNEW[0] + seperator;
        }
      }
    }

    if (dd.isNotEmpty) {
      finalString = dd;
      if (dd.length == 2 &&
          !dd.contains(seperator) &&
          oldVal.length < value.length &&
          splitArrNEW[1].isNotEmpty) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      } else if (splitArrNEW[2].isNotEmpty &&
          splitArrNEW[1].isEmpty &&
          tempOldval.length > tempValue.length) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      } else if (oldVal.length < value.length &&
          (splitArrNEW[1].isNotEmpty || splitArrNEW[2].isNotEmpty)) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      }
    } else if (_backSlashCount(tempOldval) == 2 && splitArrNEW[1].isNotEmpty) {
      dd += seperator;
    }

    if (splitArrNEW[0].length == 3 && splitArrOLD[1].isEmpty) {
      mm = splitArrNEW[0][2];
    }

    if (splitArrNEW[1].length > splitArrOLD[1].length) {
      if (splitArrNEW[1].length < 3) {
        mm = splitArrNEW[1];
      } else {
        for (var i = 0; i < 2; i++) {
          mm += splitArrNEW[1][i];
        }
      }
      if (mm.length == 2 && !mm.contains(seperator)) {
        mm += seperator;
      }
    } else if (splitArrNEW[1].length == splitArrOLD[1].length) {
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1];
      }
    } else if (splitArrNEW[1].length < splitArrOLD[1].length) {
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1] + seperator;
      }
    }

    if (mm.isNotEmpty) {
      finalString += mm;
      if (mm.length == 2 && !mm.contains(seperator)) {
        if (tempOldval.length < tempValue.length) {
          finalString += seperator;
        }
      }
    }

    if (splitArrNEW[1].length == 3 && splitArrOLD[2].isEmpty) {
      yyy = splitArrNEW[1][2];
    }

    if (splitArrNEW[2].length > splitArrOLD[2].length) {
      if (splitArrNEW[2].length < 5) {
        yyy = splitArrNEW[2];
      } else {
        for (var i = 0; i < 4; i++) {
          yyy += splitArrNEW[2][i];
        }
      }
    } else if (splitArrNEW[2].length == splitArrOLD[2].length) {
      if (splitArrNEW[2].isNotEmpty) {
        yyy = splitArrNEW[2];
      }
    } else if (splitArrNEW[2].length < splitArrOLD[2].length) {
      yyy = splitArrNEW[2];
    }

    if (yyy.isNotEmpty) {
      if (_backSlashCount(finalString) < 2) {
        if (splitArrNEW[0].isEmpty && splitArrNEW[1].isEmpty) {
          finalString = seperator + seperator + yyy;
        } else {
          finalString = finalString + seperator + yyy;
        }
      } else {
        finalString += yyy;
      }
    } else {
      if (_backSlashCount(finalString) > 1 && oldVal.length > value.length) {
        var valueUpdate = finalString.split(seperator);
        finalString = valueUpdate[0] + seperator + valueUpdate[1];
      }
    }
  }

  return finalString;
}

TextSelection _updateCursorPosition(String text, TextEditingValue oldValue) {
  var endOffset = max(
    oldValue.text.length - oldValue.selection.end,
    0,
  );
  var selectionEnd = text.length - endOffset;
  // print('My log ---> $selectionEnd');
  return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
}

int _backSlashCount(String value) {
  return '/'.allMatches(value).length;
}
