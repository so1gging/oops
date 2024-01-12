import 'package:gsheets/gsheets.dart';
import 'package:oops_flutter/services/google_sheet_service.dart';

class WordListController {
  static late GoogleSheetService _gsheetService = GoogleSheetService();

  Future<List<Worksheet>> getWordListCount() async {
    List<Worksheet> allSheets = await _gsheetService.getAllWorksheet();
    return allSheets;
  }
}
