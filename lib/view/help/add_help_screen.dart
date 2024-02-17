import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

class AddHelpScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  AddHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg1.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/back.png'))),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Bize Ulaşın',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 65,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bize Ulaşın',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 175,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 240,
                  height: 45,
                  child: TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                          hintText: 'Başlık...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tanım',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 210,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 240,
                  height: 140,
                  child: TextFormField(
                      maxLines: 6,
                      controller: _descController,
                      decoration: InputDecoration(
                          hintText: 'Tanım...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
