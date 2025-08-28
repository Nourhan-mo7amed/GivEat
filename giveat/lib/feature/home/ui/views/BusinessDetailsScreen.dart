import 'package:flutter/material.dart';

import '../../../../color.dart';
import '../../../auth/ui/widgets/reusable_text_field.dart';
import 'location_screen.dart';

class BusinessDetailsScreen extends StatefulWidget {
  const BusinessDetailsScreen({super.key});

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Map<String, bool> foodTypes = {
    "Cooked Meals": false,
    "Main Dishes": true,
    "Side Dishes": false,
    "Street Food": false,
    "Breads & Pastries": false,
    "Dairies": false,
    "Desserts & Sweets": false,
  };

  List<String> dishes = ["Koshary", "Bamya"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Business Logo
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.store, size: 40, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              const Text(
                "Business Logo",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              ReusableTextField(
                labelText: "Business Name",
                controller: nameController,
              ),
              ReusableTextField(
                labelText: "Contact Number",
                controller: contactController,
              ),
              ReusableTextField(
                labelText: "Description",
                controller: descriptionController,
              ),

              // Location Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final selectedLocation = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LocationScreen()),
                    );

                    if (selectedLocation != null) {
                      print("User selected: $selectedLocation");
                    }
                  },

                  icon: const Icon(Icons.location_on, color: Colors.white),
                  label: const Text(
                    "Location",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Type of food",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // Checkboxes
              Wrap(
                spacing: 0,
                runSpacing: 4,
                children: foodTypes.keys.map((key) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: foodTypes[key],
                        onChanged: (value) {
                          setState(() {
                            foodTypes[key] = value ?? false;
                          });
                        },
                        side: const BorderSide(color: Colors.grey, width: 1.5),
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: AppColors.primaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                      Text(
                        key,
                        style: TextStyle(
                          fontSize: 14,
                          color: foodTypes[key]!
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dishes you can provide",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // Dishes Chips
              Wrap(
                spacing: 8,
                runSpacing: 12,
                children: [
                  ...dishes.map(
                    (dish) => Chip(
                      label: Text(dish),
                      backgroundColor: AppColors.primaryColor,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  ActionChip(
                    label: const Text("Add +"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final TextEditingController dishController =
                              TextEditingController();
                          return AlertDialog(
                            title: const Text("Add Dish"),
                            content: TextField(
                              controller: dishController,
                              decoration: const InputDecoration(
                                hintText: "Enter dish name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (dishController.text.trim().isNotEmpty) {
                                    setState(() {
                                      dishes.add(dishController.text.trim());
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text("Add"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
