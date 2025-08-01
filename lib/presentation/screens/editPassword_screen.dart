// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kispay_merchant/core/constant/colors.dart';
// import 'package:kispay_merchant/presentation/controllers/merchantDetails_controller.dart';
// import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

// class ChangePasswordScreenz extends StatefulWidget {
//   const ChangePasswordScreenz({super.key});

//   @override
//   State<ChangePasswordScreenz> createState() => _ChangePasswordScreenzState();
// }

// class _ChangePasswordScreenzState extends State<ChangePasswordScreenz> {
//   final _formKey = GlobalKey<FormState>();

//   final oldPasswordController = TextEditingController();
//   final newPasswordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   bool obscureOld = true;
//   bool obscureNew = true;
//   bool obscureConfirm = true;

//   @override
//   void initState() {
//     super.initState();
//     newPasswordController.addListener(() {
//       setState(() {}); // Rebuild to update password requirement checks
//     });
//   }

//   @override
//   void dispose() {
//     oldPasswordController.dispose();
//     newPasswordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Change Password'),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: oldPasswordController,
//                 obscureText: obscureOld,
//                 decoration: _inputDecoration('Old Password', () {
//                   setState(() => obscureOld = !obscureOld);
//                 }, obscureOld),
//                 validator: (value) => value!.isEmpty ? 'Please enter old password' : null,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: newPasswordController,
//                 obscureText: obscureNew,
//                 decoration: _inputDecoration('New Password', () {
//                   setState(() => obscureNew = !obscureNew);
//                 }, obscureNew),
//                 validator: (value) => value!.isEmpty ? 'Please enter new password' : null,
//               ),
//               const SizedBox(height: 12),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildRequirement("At least 8 characters", newPasswordController.text.length >= 8),
//                     _buildRequirement("Includes uppercase letter", RegExp(r'[A-Z]').hasMatch(newPasswordController.text)),
//                     _buildRequirement("Includes lowercase letter", RegExp(r'[a-z]').hasMatch(newPasswordController.text)),
//                     _buildRequirement("Includes a number", RegExp(r'[0-9]').hasMatch(newPasswordController.text)),
//                     _buildRequirement("Includes special character (!@#\$&*~)", RegExp(r'[!@#\$&*~]').hasMatch(newPasswordController.text)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: confirmPasswordController,
//                 obscureText: obscureConfirm,
//                 decoration: _inputDecoration('Confirm Password', () {
//                   setState(() => obscureConfirm = !obscureConfirm);
//                 }, obscureConfirm),
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Please confirm new password';
//                   if (value != newPasswordController.text) return 'Passwords do not match';
//                   return null;
//                 },
//               ),
//               const Spacer(),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: mainColor,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Call controller method to change password
//                       Get.snackbar('Success', 'Password changed successfully');
//                       Get.back();
//                     }
//                   },
//                   child: const Text('Change Password', style: TextStyle(color: Colors.white, fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String label, VoidCallback toggleVisibility, bool isObscured) {
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       suffixIcon: IconButton(
//         icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
//         onPressed: toggleVisibility,
//       ),
//     );
//   }

//   Widget _buildRequirement(String text, bool isMet) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Row(
//         children: [
//           Icon(isMet ? Icons.check_circle : Icons.cancel, size: 16, color: isMet ? Colors.green : Colors.red),
//           const SizedBox(width: 8),
//           Text(text, style: TextStyle(color: isMet ? Colors.green : Colors.red, fontSize: 13)),
//         ],
//       ),
//     );
//   }
// }








// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({super.key});

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final MerchantDetailsController controller = Get.find<MerchantDetailsController>();

//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();

//   final _formKey = GlobalKey<FormState>();

//   final oldPasswordController = TextEditingController();
//   final newPasswordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   bool obscureOld = true;
//   bool obscureNew = true;
//   bool obscureConfirm = true;

//   @override
//   void initState() {
//     super.initState();
//     newPasswordController.addListener(() {
//       setState(() {}); // Rebuild to update password requirement checks
//     });
//   }

//   @override
//   void dispose() {
//     oldPasswordController.dispose();
//     newPasswordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Edit Profile'),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: oldPasswordController,
//                 obscureText: obscureOld,
//                 decoration: _inputDecoration('Old Password', () {
//                   setState(() => obscureOld = !obscureOld);
//                 }, obscureOld),
//                 validator: (value) => value!.isEmpty ? 'Please enter old password' : null,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: newPasswordController,
//                 obscureText: obscureNew,
//                 decoration: _inputDecoration('New Password', () {
//                   setState(() => obscureNew = !obscureNew);
//                 }, obscureNew),
//                 validator: (value) => value!.isEmpty ? 'Please enter new password' : null,
//               ),
              
             
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: confirmPasswordController,
//                 obscureText: obscureConfirm,
//                 decoration: _inputDecoration('Confirm Password', () {
//                   setState(() => obscureConfirm = !obscureConfirm);
//                 }, obscureConfirm),
//                 validator: (value) {
//                   if (value!.isEmpty) return 'Please confirm new password';
//                   if (value != newPasswordController.text) return 'Passwords do not match';
//                   return null;
//                 },
//               ),
//                const SizedBox(height: 12),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildRequirement("At least 8 characters", newPasswordController.text.length >= 8),
//                     _buildRequirement("Includes uppercase letter", RegExp(r'[A-Z]').hasMatch(newPasswordController.text)),
//                     _buildRequirement("Includes lowercase letter", RegExp(r'[a-z]').hasMatch(newPasswordController.text)),
//                     _buildRequirement("Includes a number", RegExp(r'[0-9]').hasMatch(newPasswordController.text)),
//                     _buildRequirement("Includes special character (!@#\$&*~)", RegExp(r'[!@#\$&*~]').hasMatch(newPasswordController.text)),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: mainColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       controller.updateProfile(
//       updatedFirstName: controller.firstNameController.text,
//       updatedMiddleName: controller.middleNameController.text,
//       updatedLastName: controller.lastNameController.text,
//     );
//                       Get.back();
//                     }
//                   },
//                   child: const Text(
//                     'Save Changes',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  

//    Widget _buildRequirement(String text, bool isMet) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Row(
//         children: [
//           Icon(isMet ? Icons.check_circle : Icons.cancel, size: 16, color: isMet ? Colors.green : Colors.red),
//           const SizedBox(width: 8),
//           Text(text, style: TextStyle(color: isMet ? Colors.green : Colors.red, fontSize: 13)),
//         ],
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String label, VoidCallback toggleVisibility, bool isObscured) {
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       suffixIcon: IconButton(
//         icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
//         onPressed: toggleVisibility,
//       ),
//     );
//   }
// }












import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.find<AuthController>();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscureOld = true;
  bool obscureNew = true;
  bool obscureConfirm = true;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }

  @override
  void initState() {
    super.initState();
    newPasswordController.addListener(() {
      setState(() {}); // For password requirement updates
    });
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change Password'),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: oldPasswordController,
                        obscureText: obscureOld,
                        decoration: _inputDecoration('Old Password', () {
                          setState(() => obscureOld = !obscureOld);
                        }, obscureOld),
                        validator: (value) => value!.isEmpty ? 'Please enter old password' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: newPasswordController,
                        obscureText: obscureNew,
                        decoration: _inputDecoration('New Password', () {
                          setState(() => obscureNew = !obscureNew);
                        }, obscureNew),
                        validator: (value) => value!.isEmpty ? 'Please enter new password' : null,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRequirement("At least 8 characters", newPasswordController.text.length >= 8),
                            _buildRequirement("Includes uppercase letter", RegExp(r'[A-Z]').hasMatch(newPasswordController.text)),
                            _buildRequirement("Includes lowercase letter", RegExp(r'[a-z]').hasMatch(newPasswordController.text)),
                            _buildRequirement("Includes a number", RegExp(r'[0-9]').hasMatch(newPasswordController.text)),
                            _buildRequirement("Includes special character (!@#\$&*~)", RegExp(r'[!@#\$&*~]').hasMatch(newPasswordController.text)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: obscureConfirm,
                        decoration: _inputDecoration('Confirm Password', () {
                          setState(() => obscureConfirm = !obscureConfirm);
                        }, obscureConfirm),
                        validator: (value) {
                          if (value!.isEmpty) return 'Please confirm new password';
                          if (value != newPasswordController.text) return 'Passwords do not match';
                          return null;
                        },
                      ),
                      const Spacer(),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.changePassword(
                               
                                 oldPassword: oldPasswordController.text,
                                 newPassword: newPasswordController.text,
                              );
                              // Trigger controller logic
                              Get.snackbar('Success', 'Password changed successfully');
                            }
                          },
                          child: const Text('Change Password', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(height: 44),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String label, VoidCallback toggleVisibility, bool isObscured) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: IconButton(
        icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
        onPressed: toggleVisibility,
      ),
    );
  }

  Widget _buildRequirement(String text, bool isMet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(isMet ? Icons.check_circle : Icons.cancel, size: 16, color: isMet ? Colors.green : Colors.red),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: isMet ? Colors.green : Colors.red, fontSize: 13)),
        ],
      ),
    );
  }
}
