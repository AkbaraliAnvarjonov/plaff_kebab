part of 'package:plaff_kebab/src/presentation/pages/auth/confirm/confirm_code_page.dart';

mixin ConfirmCodeMixin on State<ConfirmCodePage> {
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;
  late PinTheme errorPinTheme;
  late final TextEditingController controller;

  @override
  void initState() {
    BlocProvider.of<ConfirmCodeBloc>(context).add(const ConfirmTime());
    SmsAutoFill().listenForCode().then((value) {
      SmsAutoFill().code.listen((event) {
        controller.text = event;
      });
    });
    controller = TextEditingController();
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border.all(color: const Color(0xFFF5F5F5)),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: const Color(0xFFFFCC00)),
      borderRadius: BorderRadius.circular(10),
    );
    errorPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.red.withOpacity(0.1),
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    );
    submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: const Color(0xFFFFCC00)),
      borderRadius: BorderRadius.circular(10),
    );
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<ConfirmCodeBloc>(context).close();
    controller.dispose();
    super.dispose();
  }
}
