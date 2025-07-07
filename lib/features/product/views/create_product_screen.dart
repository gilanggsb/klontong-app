import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../lib.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late CreateProductCubit createProductCubit;

  @override
  void initState() {
    createProductCubit = getIt.get<CreateProductCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createProductCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Create Product')),
        body: BlocConsumer<CreateProductCubit, CreateProductState>(
          listener: (context, state) {
            switch (state) {
              case CreateProductProductCreatedState():
                SnackbarManager.showSuccessSnackbar(message: "Product created successfully!");
                NavigationService.pop();
                break;
              case CreateProductFailedState(:final message):
                SnackbarManager.showErrorSnackbar(message: message);
                break;
              default:
            }
          },
          builder: (context, state) {
            if (state is CreateProductLoadingState) {
              return const Center(child: DefaultCircularProgressIndicator(size: 18));
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: _formKey,
                child: ListView(
                  children: [
                    _buildField(ProductFormFields.sku),
                    _buildField(ProductFormFields.name),
                    _buildField(ProductFormFields.description, null, 2),
                    _buildField(ProductFormFields.weight, TextInputType.number),
                    _buildField(ProductFormFields.width, TextInputType.number),
                    _buildField(ProductFormFields.length, TextInputType.number),
                    _buildField(ProductFormFields.height, TextInputType.number),
                    _buildField(ProductFormFields.image, null, 1, false),
                    _buildField(ProductFormFields.price, TextInputType.number),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          final form = _formKey.currentState!.value;
                          final product = Product(
                            sku: form[ProductFormFields.sku],
                            name: form[ProductFormFields.name],
                            description: form[ProductFormFields.description],
                            weight: int.parse(form[ProductFormFields.weight]),
                            width: int.parse(form[ProductFormFields.width]),
                            length: int.parse(form[ProductFormFields.length]),
                            height: int.parse(form[ProductFormFields.height]),
                            image: form[ProductFormFields.image],
                            price: form[ProductFormFields.price],
                          );
                          createProductCubit.createProduct(product);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppPalette.primaryBase),
                      ),
                      child: Text(
                        'Submit',
                        style: AppStyle.text.copyWith(fontSize: 16, color: AppPalette.whiteBase),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildField(String name, [TextInputType? type, int maxLines = 1, bool isRequired = true]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
        name: name,
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: name.replaceAll('_', ' ').toUpperCase(),
          border: const OutlineInputBorder(),
        ),
        validator: isRequired ? FormBuilderValidators.required() : null,
      ),
    );
  }
}
