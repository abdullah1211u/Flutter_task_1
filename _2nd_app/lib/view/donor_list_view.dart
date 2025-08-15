import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/donor_controller.dart';
import '/model/fake_data.dart';

class DonorListView extends StatelessWidget {
  const DonorListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final DonorController controller = Get.put(DonorController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Donor List"),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: FakeDonors.donorList.length,
        itemBuilder: (context, index) {
          final donor = FakeDonors.donorList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: ListTile(
              onTap: () {
                // Show details dialog on tap
                controller.showDonorDetails(context, donor);
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(donor.image),
              ),
              title: Text(donor.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("ফোন: ${donor.phone}"),
              // This creates the blood group badge
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red, width: 1.5)
                ),
                child: Text(
                  donor.bloodGroup,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}