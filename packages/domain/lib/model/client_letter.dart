import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClientLetter extends Equatable {
  final String status;
  final String client;
  final String letter;

  const ClientLetter({
    required this.status,
    required this.client,
    required this.letter,
  });

  @override
  List<Object?> get props => [
    status,
    client,
    letter,
  ];
}
