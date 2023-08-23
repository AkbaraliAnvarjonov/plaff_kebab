part of 'package:plaff_kebab/src/presentation/pages/main/orders/orders_page.dart';

mixin OrdersMixin on State<OrdersPage> {
  late final ScrollController scrollController;
  late final DatabaseBloc bloc;
  void initStateController(TickerProvider tickerProvider) {}
  @override
  void initState() {
    BlocProvider.of<DatabaseBloc>(context).add(GetProduct());
    scrollController = ScrollController();
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
