part of 'package:plaff_kebab/src/presentation/pages/main/cart/cart_page.dart';

mixin OrdersMixin on State<OrdersPage> {
  late final ScrollController scrollController;
  late final TextEditingController orderController;
  late final DatabaseBloc bloc;
  void initStateController(TickerProvider tickerProvider) {}
  @override
  void initState() {
    BlocProvider.of<DatabaseBloc>(context).add(GetProduct());
    scrollController = ScrollController();
    orderController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!mounted) return;
    bloc = context.read<DatabaseBloc>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
