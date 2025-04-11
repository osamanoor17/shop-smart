// ignore_for_file: unused_element, unused_local_variable, unused_field

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsmart_admin_en/consts/app_constants.dart';
import 'package:shopsmart_admin_en/consts/validator.dart';
import 'package:shopsmart_admin_en/models/product_model.dart';
import 'package:shopsmart_admin_en/services/my_app_functions.dart';
import 'package:shopsmart_admin_en/widgets/subtitle_text.dart';
import 'package:shopsmart_admin_en/widgets/title_text.dart';

class EditorUploadProductScreen extends StatefulWidget {
  static const routeName = '/EditorUploadProductScreen';
  final ProductModel? productModel;
  const EditorUploadProductScreen({super.key, this.productModel});

  @override
  State<EditorUploadProductScreen> createState() =>
      _EditorUploadProductScreenState();
}

class _EditorUploadProductScreenState extends State<EditorUploadProductScreen> {
  final _formkey = GlobalKey<FormState>();
  XFile? _pickedImage;

  late TextEditingController _titleController,
      _descriptionController,
      _priceController,
      _quantityController;
  String? _categoryValue;
  bool isEditing = false;
  String? productNetworkImage;
  @override
  void initState() {
    if (widget.productModel != null) {
      isEditing = true;
      productNetworkImage = widget.productModel!.productImage;
      _categoryValue = widget.productModel!.productCategory;
    }
    _titleController =
        TextEditingController(text: widget.productModel?.productTitle);
    _descriptionController =
        TextEditingController(text: widget.productModel?.productDescription);
    _priceController =
        TextEditingController(text: widget.productModel?.productPrice);
    _quantityController =
        TextEditingController(text: widget.productModel?.productQuantity);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void clearForm() {
    _titleController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _quantityController.clear();
    removePickedImage();
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<void> _uploadProduct() async {
    if (_pickedImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
          context: context, subtitle: "Please pick up an Image", fct: () {});
      return;
    }

    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context);
    if (isValid) {}
  }

  Future<void> _editProduct() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null && productNetworkImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
          context: context, subtitle: "Please pick up an Image", fct: () {});
      return;
    }
    if (isValid) {}
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
        context: context,
        cameraFCT: () async {
          _pickedImage = await picker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
        galleryFCT: () async {
          _pickedImage = await picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        removeFCT: () async {
          setState(() {
            _pickedImage = null;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          bottomSheet: SizedBox(
            height: kBottomNavigationBarHeight + 75,
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      clearForm();
                    },
                    icon: const Icon(Icons.clear),
                    label: const Text(
                      "Clear  ",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (isEditing) {
                        _editProduct();
                      } else {
                        _uploadProduct();
                      }
                    },
                    icon: const Icon(Icons.upload),
                    label: Text(
                      isEditing ? "Upload Product" : "Edit Product",
                      style: const TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        // backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
              centerTitle: true,
              title: TitlesTextWidget(
                  label: isEditing ? "Edit Product" : "Add a new product")),
          body: SafeArea(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // image picker
                    if (isEditing && productNetworkImage != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          productNetworkImage!,
                          height: size.width * 0.4,
                          alignment: Alignment.center,
                        ),
                      ),
                    ] else if (_pickedImage == null) ...[
                      SizedBox(
                        width: size.width * 0.4 + 10,
                        height: size.width * 0.35,
                        child: DottedBorder(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Icon(
                                Icons.image_outlined,
                                color: Colors.blue,
                                size: 50,
                              ),
                              TextButton(
                                  onPressed: () {
                                    localImagePicker();
                                  },
                                  child: const Center(
                                      child: Text(
                                    "Pick Product Image",
                                    style: TextStyle(color: Colors.blue),
                                  )))
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_pickedImage!.path),
                          height: size.width * 0.4,
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                    if (_pickedImage != null ||
                        productNetworkImage == null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              localImagePicker();
                            },
                            child: const Text(
                              "Pick another Image",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              removePickedImage();
                            },
                            child: const Text("Remove Image",
                                style: TextStyle(color: Colors.red)),
                          )
                        ],
                      )
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    // Category dropdown widget
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButtonFormField<String>(
                        items: AppConstants.categoriesDropDownList,
                        value: _categoryValue,
                        decoration: InputDecoration(
                          labelText: 'Choose a Category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey, // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          filled: true,
                          fillColor: Colors.black12,
                          hintText: 'Select a category',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _categoryValue = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose a category';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: Colors.red, // Text color
                          fontSize: 16.0, // Font size
                        ),
                        elevation: 2,
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _titleController,
                              key: const ValueKey("Title"),
                              maxLength: 100,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              decoration: const InputDecoration(
                                hintText: "Product Title",
                                fillColor: Colors.black12,
                              ),
                              validator: (value) {
                                return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString:
                                        "Please enter a valid title");
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _priceController,
                                    key: const ValueKey('Price \$'),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^(\d+)?\.?\d{0,2}'),
                                      ),
                                    ],
                                    decoration: const InputDecoration(
                                        fillColor: Colors.black12,
                                        hintText: 'Price',
                                        prefix: SubtitleTextWidget(
                                          label: "\$ ",
                                          color: Colors.blue,
                                          fontSize: 16,
                                        )),
                                    validator: (value) {
                                      return MyValidators.uploadProdTexts(
                                        value: value,
                                        toBeReturnedString: "Price is missing",
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: _quantityController,
                                    keyboardType: TextInputType.number,
                                    key: const ValueKey('Quantity'),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.black12,
                                      hintText: 'Qty',
                                    ),
                                    validator: (value) {
                                      return MyValidators.uploadProdTexts(
                                        value: value,
                                        toBeReturnedString:
                                            "Quantity is missed",
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              key: const ValueKey('Description'),
                              controller: _descriptionController,
                              minLines: 4,
                              maxLines: 8,
                              maxLength: 1000,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: const InputDecoration(
                                fillColor: Colors.black12,
                                hintText: 'Product description',
                              ),
                              validator: (value) {
                                return MyValidators.uploadProdTexts(
                                  value: value,
                                  toBeReturnedString: "Description is missed",
                                );
                              },
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kBottomNavigationBarHeight + 10,
                    )
                  ],
                )),
          ),
        ));
  }
}
