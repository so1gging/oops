
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';

/// Google Sheet 에 접근하는 서비스

class GoogleSheetService {
  static late final _gsheets = GSheets(dotenv.env['GOOGLE_SHEET_CREDENTIAL_ID']);
  static late final Spreadsheet? _spreadsheet;

  GoogleSheetService() {
    _init();
  }

   _init() async {
    _spreadsheet = await _gsheets.spreadsheet(dotenv.env['SHEET_ID'] ?? '');
  }

  getWorksheetByIndex(int index) async {
    return await _spreadsheet?.worksheetByIndex(index);
  }

  getRow(Worksheet sheet,int index) async {
    return await sheet.values.row(index);
  }

}

