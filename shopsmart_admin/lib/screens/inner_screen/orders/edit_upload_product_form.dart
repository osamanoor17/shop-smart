// ignore_for_file: unused_element, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsmart_admin_en/consts/validator.dart';
import 'package:shopsmart_admin_en/services/my_app_functions.dart';
import 'package:shopsmart_admin_en/widgets/subtitle_text.dart';
import 'package:shopsmart_admin_en/widgets/title_text.dart';

class EditorUploadProductScreen extends StatefulWidget {
  static const routeName = '/EditorUploadProductScreen';
  const EditorUploadProductScreen({super.key});

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
  String? _categoryController;

  @override
  void initState() {
    _titleController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
    _priceController = TextEditingController(text: "");
    _quantityController = TextEditingController(text: "");
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
    if (_pickedImage == null) {
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
    final size = MediaQuery.of(context);
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          bottomSheet: SizedBox(
            height: kBottomNavigationBarHeight + 50,
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
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
                      _uploadProduct();
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text(
                      "Upload Product",
                      style: TextStyle(fontSize: 20),
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
              title: const TitlesTextWidget(label: "Add a new product")),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                  // to implement the image picker
                  // image picker
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
                          ),
                          validator: (value) {
                            return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                    "Please enter a valid title");
                          },
                        ),
                        const SizedBox(
                          height: 10,
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
                                  hintText: 'Qty',
                                ),
                                validator: (value) {
                                  return MyValidators.uploadProdTexts(
                                    value: value,
                                    toBeReturnedString: "Quantity is missed",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          key: const ValueKey('Description'),
                          controller: _descriptionController,
                          minLines: 5,
                          maxLines: 8,
                          maxLength: 1000,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
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
