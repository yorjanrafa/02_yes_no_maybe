import 'package:dio/dio.dart';
import 'package:yes_no_maybe_chat/domain/entities/message.dart';
import 'package:yes_no_maybe_chat/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    response.data['answer'];

    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}
