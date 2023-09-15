part of 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/checkout_page.dart';

mixin OrdersMixin on State<CheckoutPage> {
  late final ScrollController scrollController;
  late final TextEditingController locationNameController;
  late final TextEditingController entranceController;
  late final TextEditingController floorController;
  late final TextEditingController flatController;
  late final TextEditingController adressNameController;
  late final TextEditingController chooseController;
  late final YandexMapController yandexMapController;
  late int selectedAdress;
  // late final DatabaseBloc bloc;
  void initStateController(TickerProvider tickerProvider) {}
  @override
  void initState() {
    selectedAdress = -1;
    // BlocProvider.of<DatabaseBloc>(context).add(GetProduct());
    scrollController = ScrollController();
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
    // bloc = context.read<DatabaseBloc>();
    super.didChangeDependencies();
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
