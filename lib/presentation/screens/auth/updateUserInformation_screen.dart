import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/merchantDetails_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final MerchantDetailsController controller = Get.find<MerchantDetailsController>();
  final _formKey = GlobalKey<FormState>();

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      controller.firstNameController.text = controller.firstName.value;
      controller.middleNameController.text = controller.middleName.value;
      controller.lastNameController.text = controller.lastName.value;
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Profile'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.firstNameController,
                decoration: _inputDecoration('First Name'),
                validator: (value) => value!.isEmpty ? 'Please enter first name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.middleNameController,
                decoration: _inputDecoration('Middle Name'),
                validator: (value) => value!.isEmpty ? 'Please enter middle name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.lastNameController,
                decoration: _inputDecoration('Last Name'),
                validator: (value) => value!.isEmpty ? 'Please enter last name' : null,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.updateProfile(
                        updatedFirstName: controller.firstNameController.text,
                        updatedMiddleName: controller.middleNameController.text,
                        updatedLastName: controller.lastNameController.text,
                      );
                      Get.back();
                    }
                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
