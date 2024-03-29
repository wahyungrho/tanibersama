part of 'shared.dart';

double defaultMargin = 24.0;

const Color greenColor = Color(0xff469d89);
Color blackColor = Colors.black87;
Color? greyColor = Colors.grey;

const TextStyle lightFontStyle = TextStyle(fontWeight: FontWeight.w300);
const TextStyle regulerFontStyle = TextStyle(fontWeight: FontWeight.w400);
const TextStyle mediumFontStyle = TextStyle(fontWeight: FontWeight.w500);
const TextStyle boldFontStyle = TextStyle(fontWeight: FontWeight.w700);

Future<File> getImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? _pickFile = await _picker.pickImage(source: ImageSource.camera);
  var image = File(_pickFile!.path);
  return image;
}
