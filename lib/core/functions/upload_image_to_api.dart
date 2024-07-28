import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart'; // لاكتشاف نوع MIME
import 'package:http_parser/http_parser.dart'; // لاستخدام MediaType

Future<MultipartFile> uploadImageToAPI(XFile image) async {

  final mimeType = lookupMimeType(image.path);


  final mediaType = mimeType != null ? MediaType.parse(mimeType) : MediaType('application', 'octet-stream');


  return MultipartFile.fromFile(
    image.path,
    filename: image.path.split('/').last,
    contentType: mediaType, 
  );
}
