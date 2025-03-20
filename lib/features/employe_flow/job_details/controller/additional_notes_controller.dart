import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planiq/core/common/widgets/error_snakbar.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/image_picker_dialog.dart';

class AdditionalNotesController extends GetxController {
  var images = <String>[].obs;
  RxString additionalNotes = "".obs;
  final ImagePicker _picker = ImagePicker();

//pick image
  Future<void> pickImages() async {
    Get.dialog(ImagePickerDialog(
      fromGaleary: (value) async {
        if (value) {
          if (images.length >= 6) {
            errorSnakbar(errorMessage: "You can only add up to 6 images.");
            return;
          }
          final XFile? pickedFile =
              await _picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            images.add(pickedFile.path);
          }
        } else {
          if (images.length >= 6) {
            errorSnakbar(errorMessage: "You can only add up to 6 images.");
            return;
          }
          final XFile? pickedFile =
              await _picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            images.add(pickedFile.path);
          }
        }
      },
    ));
  }

  //remove image

  void removeImage(int index) {
    images.removeAt(index);
  }
}
