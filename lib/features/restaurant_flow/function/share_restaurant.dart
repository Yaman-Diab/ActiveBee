import 'dart:io';
import 'package:active_bee/features/restaurant_flow/models/restaurant_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareRestaurant(RestaurantModel restaurant) async {
  try {
    // 1. تحميل الصورة من الأصول
    final ByteData bytes = await rootBundle.load(restaurant.imageAsset);

    // 2. تحديد مجلد مؤقت
    final Directory tempDir = await getTemporaryDirectory();

    // 3. إنشاء ملف مؤقت بنفس اسم الصورة
    final File file = File('${tempDir.path}/shared_restaurant.png');

    // 4. كتابة الصورة فيه
    await file.writeAsBytes(bytes.buffer.asUint8List());

    // 5. مشاركة الصورة مع النص
    await Share.shareXFiles(
      [XFile(file.path)],
      text: '🍽️ جرب مطعم ${restaurant.name} الرائع!',
    );
  } catch (e) {
    print('❌ خطأ أثناء المشاركة: $e');
  }
}
