part of 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/checkout_page.dart';

mixin OrdersMixin on State<CheckoutPage> {
  late final TextEditingController locationNameController;
  late final TextEditingController entranceController;
  late final TextEditingController floorController;
  late final TextEditingController flatController;
  late final TextEditingController adressNameController;
  late final TextEditingController chooseController;
  late final TabController tabController;
  late int selectedAdress;
  bool isCourierCall = true;
  @override
  void initState() {
    selectedAdress = -1;
    locationNameController = TextEditingController();
    entranceController = TextEditingController();
    floorController = TextEditingController();
    flatController = TextEditingController();
    adressNameController = TextEditingController();
    chooseController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!mounted) return;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    locationNameController.dispose();
    entranceController.dispose();
    flatController.dispose();
    floorController.dispose();
    adressNameController.dispose();
    tabController.dispose();
    super.dispose();
  }
}
