import 'dart:io';
import 'package:flutter/material.dart';
import 'package:giveat/color.dart';
import 'package:image_picker/image_picker.dart';

import '../../../auth/ui/widgets/reusable_text_field.dart';

class DishDetailsScreen extends StatefulWidget {
  const DishDetailsScreen({super.key});

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  final TextEditingController dishNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController portionController = TextEditingController();

  String? selectedCondition;
  final List<File> dishImages = []; 
  final ImagePicker _picker = ImagePicker();

  Future<void> _addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        dishImages.add(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Dish Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // صور الأطباق
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    ...dishImages.map(
                      (img) => Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: FileImage(img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _addImage,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: const Icon(Icons.add, size: 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Dish Photo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // حقول الإدخال
            ReusableTextField(
              labelText: "Dish Name",
              hintText: "Dish Name",
              controller: dishNameController,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Condition",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: selectedCondition,
              hint: const Text("Select"),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
              ),
              items: ["Cooked", "Fresh", "Perishable", "Frozen"]
                  .map(
                    (condition) => DropdownMenuItem(
                      value: condition,
                      child: Text(condition),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCondition = value;
                });
              },
            ),
            const SizedBox(height: 20),

            ReusableTextField(
              labelText: "Description",
              hintText: "Description",
              controller: descriptionController,
            ),
            ReusableTextField(
              labelText: "Quantity",
              hintText: "Quantity",
              controller: quantityController,
            ),
            ReusableTextField(
              labelText: "Portion",
              hintText: "Portion",
              controller: portionController,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
    );
  }
}
