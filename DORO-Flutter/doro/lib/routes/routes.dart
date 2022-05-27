import 'package:flutter/material.dart';
import '../chat/chat_widget.dart';
import '../notas/notas_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

Route createChat(IO.Socket socket, List<String> nameChat) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChatWidget(socket, nameChat),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createNotas() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const NotasWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
