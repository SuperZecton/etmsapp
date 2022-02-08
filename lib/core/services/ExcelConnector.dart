import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class ExcelHandler {
  ExcelHandler();

  Future<void> excelSheetTools() async{
    // New Excel Document
    /*Workbook workbook = new Workbook();
    //Accessing via Index
    workbook.worksheets[0];
    List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    String path = (await getApplicationSupportDirectory()).path;
    String filename = '$path/Output.xlsx';
    print(filename);
    File file = File(bytes,filename);*/
  }

}