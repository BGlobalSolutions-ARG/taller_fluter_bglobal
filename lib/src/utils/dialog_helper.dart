import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../domain/domains.dart';
import '../presentation/widgets/widgets.dart';

mixin DialogHelper {
  static final key = GlobalKey<ScaffoldMessengerState>();

  static bool isPreloading = false;
  static final FToast toast = FToast();
  static void hidePreloader() {
    if (!isPreloading) return;
    isPreloading = false;
    if (Navigator.canPop(dialogContext!)) {
      Navigator.of(dialogContext!).pop();
    }
  }

  static void miniToast(String message) => Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black87,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
      );

  static BuildContext? dialogContext;

  // static ScaffoldFeatureController? controller;

  // static FutureOr<Object?> catchError(Object error) {
  //   // print("error");
  //   // print(error);
  //   // print(StackTrace.current);
  //   if (error is Exception) {
  //     showError(error.toString());
  //   } else {
  //     showError(error.toString());
  //   }

  //   return Future.value(error);
  // }

  // static void showError(
  //   Object object, {
  //   String title = 'Error:',
  // }) {
  //   String error = '';
  //   if (object is Failure) {
  //     object = object.getError()!;
  //   }
  //   if (object is DioException) {
  //     error = object.message ?? '${object.error ?? object.message}';
  //   } else {
  //     error = object.toString();
  //   }

  //   toast.removeQueuedCustomToasts();
  //   toast.showToast(
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: const Duration(seconds: 4),
  //     child: Dismissible(
  //       key: UniqueKey(),
  //       child: Container(

  //         padding: const EdgeInsets.all(16.0),
  //         constraints: const BoxConstraints(maxWidth: 512),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(6.0),
  //           color: Colors.red,
  //           // boxShadow: const [
  //           //   BoxShadow(blurRadius: 10.0, color: Palette.gray5),
  //           // ],
  //         ),
  //         width: double.infinity,
  //         child: Text(
  //           error,
  //           maxLines: 3,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static void showSuccess(String message) {
  //   toast.removeQueuedCustomToasts();
  //   toast.showToast(
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: const Duration(seconds: 4),
  //     child: Dismissible(
  //       key: UniqueKey(),
  //       child: Container(
  //         constraints: const BoxConstraints(maxWidth: 512),
  //         padding: const EdgeInsets.all(16.0),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(6.0),
  //           color: Colors.green,
  //           boxShadow: const [
  //             BoxShadow(blurRadius: 10.0, color: Palette.gray5),
  //           ],
  //         ),
  //         width: double.infinity,
  //         child: Text(
  //           message,
  //           maxLines: 3,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             // fontWeight: FontWeight.w300,
  //             fontSize: 14,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static void showInfo(String message) {
  //   toast.removeQueuedCustomToasts();
  //   toast.showToast(
  //     gravity: ToastGravity.CENTER,
  //     toastDuration: const Duration(seconds: 8),
  //     child: Dismissible(
  //       key: UniqueKey(),
  //       child: Container(
  //         padding: const EdgeInsets.all(16.0),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(6.0),
  //           color: Colors.white,
  //           boxShadow: const [
  //             BoxShadow(blurRadius: 10.0, color: Palette.gray5),
  //           ],
  //         ),
  //         width: double.infinity,
  //         child: Text(
  //           message,
  //           maxLines: 3,
  //           style: const TextStyle(
  //             color: Palette.gray2,
  //             // fontWeight: FontWeight.w300,
  //             fontSize: 14,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Future<bool> ifDialog({
    required BuildContext context,
    required String message,
    String title = 'Atención',
    String cancel = 'Cancelar',
    String accept = 'Aceptar',
  }) async {
    final result = await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            color: Palette.gray1,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        actions: [
          CustomButton.alt(
            label: cancel,
            onTap: () => Navigator.of(ctx).pop(false),
          ),
          CustomButton(
            label: accept,
            onTap: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  // static Future infoDialog({
  //   required BuildContext context,
  //   required String message,
  //   String title = 'Información',
  //   String accept = 'Aceptar',
  // }) async {
  //   final result = await showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text(
  //         title,
  //         style: const TextStyle(
  //           color: Palette.gray1,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       content: Text(
  //         message,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.w400,
  //           fontSize: 16.0,
  //         ),
  //       ),
  //       actions: [
  //         CustomButton(
  //           label: accept,
  //           onTap: () => Navigator.of(ctx).pop(true),
  //         ),
  //       ],
  //     ),
  //   );
  //   return result ?? false;
  // }
}

extension DialogExtension on BuildContext {
  static bool isPreloading = false;
  static BuildContext? dialogContext;
  static final FToast toast = FToast();
  void showError(
    Object object, {
    String title = 'Error:',
  }) {
    String error = '';
    if (object is Failure) {
      object = object.getError()!;
    }
    if (object is DioException) {
      error = object.message ?? '${object.error ?? object.message}';
    } else {
      error = object.toString();
    }
    toast.init(this).removeQueuedCustomToasts();
    toast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
      child: Dismissible(
        key: UniqueKey(),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 512),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.red,
            // boxShadow: const [
            //   BoxShadow(blurRadius: 10.0, color: Palette.gray5),
            // ],
          ),
          width: double.infinity,
          child: Text(
            error,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  void showSuccess(String message) {
    toast.init(this).removeQueuedCustomToasts();
    toast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
      child: Dismissible(
        key: UniqueKey(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 512),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.green,
            boxShadow: const [
              BoxShadow(blurRadius: 10.0, color: Palette.gray5),
            ],
          ),
          width: double.infinity,
          child: Text(
            message,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  void showInfo(String message) {
    toast.init(this).removeQueuedCustomToasts();
    toast.showToast(
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 8),
      child: Dismissible(
        key: UniqueKey(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 10.0, color: Palette.gray5),
            ],
          ),
          width: double.infinity,
          child: Text(
            message,
            maxLines: 3,
            style: const TextStyle(
              color: Palette.gray2,
              // fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> hidePreloader() async {
    if (_stopwatch == null) return;
    if (_stopwatch!.elapsedMilliseconds < 300) {
      await Future.delayed(
        Duration(
          milliseconds: 300 - _stopwatch!.elapsedMilliseconds,
        ),
      );
    }
    _stopwatch?.stop();
    _stopwatch?.reset();
    if (dialogContext != null) {
      bool canPop = false;
      try {
        canPop = Navigator.canPop(dialogContext!);
      } on Exception {
        return;
      } catch (e) {
        return;
      }

      if (canPop) Navigator.pop(dialogContext!);
    }
  }

  static Stopwatch? _stopwatch;

  void showPreloader() async {
    if (isPreloading) return;
    isPreloading = true;
    _stopwatch ??= Stopwatch();
    _stopwatch?.start();
    await showDialog(
      useSafeArea: false,
      context: this,
      builder: (ctx) {
        dialogContext = ctx;
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Palette.primary.withOpacity(.7),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator()
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
    isPreloading = false;
  }
}
