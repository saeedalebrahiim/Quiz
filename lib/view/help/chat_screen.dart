import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controller/ticket/ticket.dart';
import 'package:quiz/global.dart';
import 'package:quiz/model/api/swagger/generated/quiz.models.swagger.dart';
import 'package:quiz/model/dto/ticket.dart';
import 'package:quiz/provider/ticket.dart';
import 'package:quiz/view/help/add_help_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.dto, required this.subject});
  final List<ChatDto> dto;
  final String subject;

  @override
  Widget build(BuildContext context) {
    TicketController.getTicketList(context: context);
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
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      subject,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
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
                      itemCount: dto.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: dto[index].isClient == true
                                ? const Color.fromARGB(255, 83, 94, 159)
                                : Colors.white,
                          ),
                          child: Text(
                            dto[index].desc.toString(),
                          ),
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
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
                    Text(
                      "Bilet kimliği: ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${dto.id}",
                      style: TextStyle(
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
