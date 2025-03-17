import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/result_model/result_model_response.dart';

class ExamResultsStorage {
  static const String _keyResults = "exam_results";
  static const String _keyUserToken = "user_token"; // 🔹 مفتاح تخزين التوكن
  static const String _keyIsRemembered = "is_remembered";

  // ✅ حفظ `userToken` عند تسجيل الدخول
  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserToken, token);
  }

  static Future<void> deleteUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserToken);
  }

  // ✅ استرجاع التوكن من التخزين المحلي
  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserToken);
  }


  // ✅ تحميل كل النتائج من SharedPreferences
  static Future<List<ExamResultModel>> getResults() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_keyResults);
    if (jsonString == null) return [];

    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => ExamResultModel.fromJson(json)).toList();
  }

  // ✅ إضافة أو تحديث نتيجة الامتحان
  static Future<void> addOrUpdateResult(ExamResultModel newResult) async {
    final prefs = await SharedPreferences.getInstance();
    List<ExamResultModel> results = await getResults();

    // تحديث النتيجة لو الامتحان موجود، وإلا يتم إضافته
    int index = results.indexWhere((result) => result.examID == newResult.examID);
    if (index != -1) {
      results[index] = newResult;
    } else {
      results.add(newResult);
    }

    String jsonString = json.encode(results.map((result) => result.toJson()).toList());
    await prefs.setString(_keyResults, jsonString);
  }



  static Future<void> rememberUser(bool remember) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsRemembered, remember);
  }
  static Future<bool> isUserRemembered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsRemembered) ?? false;
  }
}
