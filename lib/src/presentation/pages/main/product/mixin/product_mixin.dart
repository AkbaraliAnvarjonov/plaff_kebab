part of 'package:plaff_kebab/src/presentation/pages/main/product/product_page.dart';

mixin ProductMixin on State<ProductPage> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
