part of 'package:plaff_kebab/src/presentation/pages/main/home/map/map_page.dart';

mixin HomeMixin on State<MapPage> {
  late final TextEditingController locationNameController;
  late final TextEditingController entranceController;
  late final TextEditingController floorController;
  late final TextEditingController flatController;
  late final TextEditingController adressNameController;

  @override
  void initState() {
    super.initState();
    locationNameController = TextEditingController();
    entranceController = TextEditingController();
    floorController = TextEditingController();
    flatController = TextEditingController();
    adressNameController = TextEditingController();
  }

  @override
  void dispose() {
    locationNameController.dispose();
    entranceController.dispose();
    flatController.dispose();
    floorController.dispose();
    adressNameController.dispose();
    super.dispose();
  }
}
