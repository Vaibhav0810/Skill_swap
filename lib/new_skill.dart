import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/skills.dart';

import 'dart:io';
// Import the file where Skills class is defined

class NewSkill extends StatefulWidget {
  const NewSkill({Key? key}) : super(key: key);

  @override
  _NewSkillState createState() => _NewSkillState();
}

class _NewSkillState extends State<NewSkill> {
  double _rating = 1;
  String? _skillName;
  File? _image;

  Future<void> _getImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Skill"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mention Skill", style: TextStyle(fontSize: 40)),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _skillName = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Skill Name*",
                  errorText:
                  _skillName == null || _skillName!.isEmpty ? 'Skill Name is Required' : null,
                ),
              ),
              const SizedBox(height: 20),
              Text("Rate yourself in this Skill"),
              Slider(
                value: _rating,
                min: 1,
                max: 10,
                divisions: 9,
                label: _rating.toString(),
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("Upload Image"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _getImage,
                child: Text("Choose Image"),
              ),
              _image != null ? Image.file(_image!) : SizedBox(), // Display selected image

              ElevatedButton(
                onPressed: () {
                  if (_skillName != null) {
                    // Create a new skill instance
                    Skills newSkill = Skills(text: _skillName!, rating: _rating.toString());
                    // Add the new skill to the skills list
                    Skills.addNewSkill(newSkill, Skills.skillsList()); // Use Skills.skillsList() to access the list
                    // Navigate back to the previous screen
                    Navigator.pop(context);
                  } else {
                    // Show an error message if skill name is not provided
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text("Please provide a skill name."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text("Upload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
