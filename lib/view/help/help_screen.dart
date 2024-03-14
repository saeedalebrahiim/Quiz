import 'package:bilgimizde/provider/drawer_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/ticket/ticket.dart';
import 'package:bilgimizde/global.dart';
import 'package:bilgimizde/model/api/swagger/generated/quiz.models.swagger.dart';
import 'package:bilgimizde/model/dto/ticket.dart';
import 'package:bilgimizde/provider/ticket.dart';
import 'package:bilgimizde/view/help/add_help_screen.dart';
import 'package:bilgimizde/view/help/chat_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
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
                                  image: AssetImage(
                                      'lib/assets/images/back.png'))),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Text(
                        'Help',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => AddHelpScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                      opacity: a,
                                      child: c,
                                    )),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('lib/assets/images/add.png'))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<TicketStateProvider>(builder: (context, value, child) {
                return Visibility(
                  visible: value.tickets.isNotEmpty,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height - 150,
                    child: ListView.builder(
                      itemCount: value.tickets.length,
                      itemBuilder: (context, index) => RawMaterialButton(
                          onPressed: () {
                            TicketController.getTicketDetail(
                                    context: context,
                                    ticketId: value.tickets[index].id ?? 0)
                                .then((v) {
                              if (v != null) {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => ChatScreen(
                                            dto: v,
                                            id: value.tickets[index].id ?? 0,
                                            subject: value
                                                .tickets[index].subject
                                                .toString(),
                                          ),
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(
                                            opacity: a,
                                            child: c,
                                          )),
                                );
                              }
                            });
                          },
                          child: RecentTicket(dto: value.tickets[index])),
                    ),
                  ),
                );
              }),
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
                      child: dto.ticketState == 1
                          ? const Icon(
                              Icons.hdr_strong,
                              color: Colors.white,
                              size: 14,
                            )
                          : dto.ticketState == 2
                              ? const Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                  size: 14,
                                )
                              : const Icon(
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
