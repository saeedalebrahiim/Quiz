import 'package:bilgimizde/controller/settings/settings.dart';
import 'package:bilgimizde/provider/settings.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';
import 'package:provider/provider.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  final QuillEditorController controller = QuillEditorController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    SettingsController.getSettings(context: context);
  }

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
                    padding: const EdgeInsets.only(left: 15, top: 45),
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
                    padding: EdgeInsets.only(top: 38),
                    child: Text(
                      'Rules',
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
              Consumer<SettingsState>(
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.white,
                    child: QuillHtmlEditor(
                      text: value.terms,
                      hintText: 'Hint text goes here',
                      controller: controller,
                      isEnabled: false,
                      minHeight: MediaQuery.sizeOf(context).height,
                      hintTextAlign: TextAlign.start,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      hintTextPadding: EdgeInsets.zero,
                      onFocusChanged: (hasFocus) =>
                          debugPrint('has focus $hasFocus'),
                      onTextChanged: (text) =>
                          debugPrint('widget text change $text'),
                      onEditorCreated: () =>
                          debugPrint('Editor has been loaded'),
                      onEditingComplete: (s) =>
                          debugPrint('Editing completed $s'),
                      onEditorResized: (height) =>
                          debugPrint('Editor resized $height'),
                      onSelectionChanged: (sel) =>
                          debugPrint('${sel.index},${sel.length}'),
                      loadingBuilder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
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
