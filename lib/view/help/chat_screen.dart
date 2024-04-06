import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/ticket/ticket.dart';
import 'package:bilgimizde/global.dart';
import 'package:bilgimizde/model/dto/ticket.dart';
import 'package:bilgimizde/provider/ticket.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key, required this.dto, required this.subject, required this.id});
  final List<ChatDto> dto;
  final String subject;
  final int id;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();
  List<ChatDto> theChats = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() {
    setState(() {
      theChats = widget.dto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 83, 94, 159),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  controller: textController,
                  onChanged: (_) {},
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Type...",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(128, 241, 244, 245),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    labelStyle: const TextStyle(
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF1D2429),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 10, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    TicketController.addTicketAnswer(
                      context: context,
                      subject: widget.subject,
                      desc: textController.text,
                      id: widget.id,
                    ).then((value) {
                      theChats.add(ChatDto(
                        createDate: DateTime.now().toString(),
                        desc: textController.text,
                        isClient: true,
                      ));
                      textController.text = "";
                      setState(() {});
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      widget.subject,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Consumer<TicketStateProvider>(
                    builder: (context, value, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: theChats.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: theChats[index].isClient == true
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: theChats[index].isClient == true
                                    ? const Color.fromARGB(255, 83, 94, 159)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                theChats[index].desc.toString(),
                                style: TextStyle(
                                    color: theChats[index].isClient == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentTicket extends StatelessWidget {
  const RecentTicket({
    super.key,
    required this.dto,
  });
  final TicketDto dto;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(20),
            border: Border(
              bottom: BorderSide(
                color: Colors.indigo.shade700,
                strokeAlign: 2,
                width: 3,
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dto.subject.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Bilet kimliği: ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${dto.id}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
