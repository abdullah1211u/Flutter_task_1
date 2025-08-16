import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/model/donor_model.dart';

class DonorController extends GetxController {
  // Shows the details of a donor in a popup dialog.
  void showDonorDetails(BuildContext context, DonorModel donor) {
    Get.dialog(
      AlertDialog(
        contentPadding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Center(child: Text(donor.name)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(donor.image),
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow("রক্তের গ্রুপ:", donor.bloodGroup),
            _buildDetailRow("ইমেইল:", donor.email),
            _buildDetailRow("ফোন:", donor.phone),
            _buildDetailRow("ঠিকানা:", donor.address),
            _buildDetailRow("শেষ রক্তদান:", donor.lastDonationDate),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("বন্ধ করুন"),
            onPressed: () {
              Get.back(); // Closes the dialog
            },
          ),
        ],
      ),
    );
  }

  // Helper widget to build a row in the dialog.
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black87),
          children: [
            TextSpan(
              text: "$label ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
