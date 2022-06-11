import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emed/core/extentions/context_extension.dart';
import 'package:emed/core/widgets/emed_text.dart';
import 'package:emed/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModal;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;
  const BaseView({
    Key? key,
    required this.viewModal,
    required this.onPageBuilder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with WidgetsBindingObserver {
  StreamSubscription? subscription;
  dynamic internetStatus;

  int _timerCounter = 0;
  Timer? _timer;
  bool _isLockScreen = false;

  void _incrementTimerCounter(Timer t) {
    print('TimerCounter is $_timerCounter');
    if (_timerCounter >= 30) {
      _isLockScreen = true;
      _timer!.cancel();
    }
    _timerCounter += 1;
    setState(() {});
  }
  //* LIFECYCLE change control

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _timerCounter = 0;
      _timer!.cancel();
    }
    if (state == AppLifecycleState.inactive) return;
    if (state == AppLifecycleState.paused) {
      _timer = Timer.periodic(
        const Duration(milliseconds: 300),
        _incrementTimerCounter,
      );
    }
    if (state == AppLifecycleState.detached) {
      _isLockScreen = true;
    }

    final isBackground = state == AppLifecycleState.paused;

    if (isBackground) {}
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        internetStatus = result;
      });
    });
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModal);
  }

  @override
  Widget build(BuildContext context) {
    return returnPage();
  }

  Widget returnPage() {
    if (internetStatus == ConnectivityResult.none) {
      return Scaffold(
        body: Center(
          child: Lottie.asset(
            'assets/lottie/no_internet_connection.json',
          ),
        ),
      );
    } else {}
    if (!_isLockScreen) {
      return widget.onPageBuilder!(context, widget.viewModal);
    } else {
      return ScreenLock(
          title: EmedText(
            text: 'Create your secret code',
            color: Colors.black,
          ),
          secretsConfig: SecretsConfig(
            spacing: 15, // or spacingRatio
            padding: const EdgeInsets.all(40),
            secretConfig: SecretConfig(
              borderColor: Colors.grey,
              borderSize: 1.0,
              disabledColor: Colors.white,
              enabledColor: Colors.blue,
              height: context.h * 0.03,
              width: context.w * 0.08,
              build: (context, {required config, required enabled}) {
                return SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          enabled ? config.enabledColor : config.disabledColor,
                      border: Border.all(
                        width: config.borderSize,
                        color: config.borderColor,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    width: config.width,
                    height: config.height,
                  ),
                  width: config.width,
                  height: config.height,
                );
              },
            ),
          ),
          inputButtonConfig: InputButtonConfig(
              height: context.h * 0.15,
              width: context.w * 0.24,
              textStyle:
                  InputButtonConfig.getDefaultTextStyle(context).copyWith(
                color: Colors.black,
              ),
              buttonStyle: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.white,
              ),
              displayStrings: [
                '0',
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
              ]),
          cancelButton: const Icon(
            Icons.close,
            color: Colors.blue,
          ),
          deleteButton: const Icon(Icons.delete),
          screenLockConfig: const ScreenLockConfig(
            backgroundColor: Colors.white,
          ),
          correctString:
              '1234',
          canCancel: false,
          
          didConfirmed: (pin) {
            setState(() {
              _isLockScreen = false;
              _timerCounter = 0;
            });
          },
          didUnlocked: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => EmedHomeView()),
                (route) => false);
          });
    }
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
    _timer!.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }
}