import 'package:flutter/material.dart';
import 'package:skill_swap/new_skill.dart';
import 'package:skill_swap/skills.dart';

class BasicInfo extends StatefulWidget {
  BasicInfo({Key? key}) : super(key: key);

  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  List<Skills> skillsList = Skills.skillsList();
  final _skillController = TextEditingController();

  void addNewSkill(Skills newSkill) {
    setState(() {
      skillsList.add(newSkill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 30),
        title: Text(
          "Skill Share",
          style: TextStyle(fontFamily: 'skillsharehomepage', fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.account_circle_sharp, size: 40),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 20, right: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1D1617).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Skills',
                  hintStyle: TextStyle(
                    color: Color(0xffDDDADA),
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                  prefixIcon: Icon(Icons.search, size: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Text(
                'Skills',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (int index = 0; index < skillsList.length; index++)
                    GestureDetector(
                      onTap: () {
                        print("Clicked");
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity, // Adjust the width of the image as needed
                              height: 150, // Adjust the height of the image as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                                image: DecorationImage(
                                  image: AssetImage(skillsList[index].getImagePath()), // Use getImagePath method from Skills class
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        skillsList[index].text!,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.green.shade700
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star, color: Colors.white,size: 12,),
                                            Text(
                                              skillsList[index].rating!,
                                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Add rating or additional details here
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewSkill())).then((newSkill) {
            if (newSkill != null) {
              addNewSkill(newSkill);
            }
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
