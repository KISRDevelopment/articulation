import 'package:flutter/material.dart';

class Story {
  final String title; // e.g., 'الجملة الأولى'
  final String content;

  Story({required this.title, required this.content});
}


final Map<String, List<Story>> StoryByLetter = {

  'أ': [
    Story(title: 'أرنب أسماء ', content: 'عند أسماء أرنب أبيض تحبه وتهتم فيه. يابت أسماء الجزر وأوراق الخس وقعد ياكل الأرنب. عطت الأرنب الماي وشرب الأرنب. صار الأرنب صديق أسماء المفضل.'),
  ],
  'ب': [
    Story(title: 'الجملة الأولى', content: 'تسبح البطة في البحيرة'),

  ],
  'ت': [
    Story(title: 'الجملة الأولى', content: 'أفتح باب البيت بالمفتاح'),

  ],
  'ث': [
    Story(title: 'الجملة الأولى', content: 'مثلث لونه أزرق'),

  ],
  'ج': [
    Story(title: 'الجملة الأولى', content: 'يعيش الجمل في الصحرا'),

  ],
  'ح': [
    Story(title: 'الجملة الأولى', content: 'الحصان حيوان سريع'),
    Story(title: 'الجملة الثانية', content: 'حمد يسبح في البحر'),
    Story(title: 'الجملة الثالثة', content: 'يفتح حمد السيارة بالمفتاح'),
  ],
  'خ': [
    Story(title: 'الجملة الأولى', content: 'الخروف ياكل العشب والخبز'),
    Story(title: 'الجملة الثانية', content: 'خالد يجمع الخرز'),
    Story(title: 'الجملة الثالثة', content: 'صليت خمس صلوات في اليوم'),
    Story(title: 'الجملة الرابعة', content: 'خالد ياكل البطيخ في الصيف'),
  ],
  'د': [
    Story(title: 'الجملة الأولى', content: 'فازت دلال بهدية'),
    Story(title: 'الجملة الثانية', content: 'ايد الدب كبيرة'),
    Story(title: 'الجملة الثالثة', content: 'يلعب محمد بالدمى'),
  ],
  'ذ': [
    Story(title: 'الجملة الأولى', content: 'الذرة لذيذة وايد'),
    Story(title: 'الجملة الثانية', content: 'التلميذ يأكل الذرة'),
  ],
  'ر': [
    Story(title: 'الجملة الأولى', content: 'شربت عصير رمان و جزر'),
    Story(title: 'الجملة الثانية', content: 'رسمت سياره لونها أحمر'),
  ],
  'ز': [
    Story(title: 'الجملة الأولى', content: 'زرعت جمانة جزر في الحديقة'),
    Story(title: 'الجملة الثانية', content: 'ياكل محمد جزر'),
    Story(title: 'الجملة الثالثة', content: 'الزرافة لها رقبه طويلة'),
  ],
  'س': [
    Story(title: 'الجملة الأولى', content: 'سمجة لونها برتقالي'),
    Story(title: 'الجملة الثانية', content: 'يصلي الولد بالمسيد'),
  ],
  'ش': [
    Story(title: 'الجملة الأولى', content: 'الفراشة ألوانها جميلة'),
    Story(title: 'الجملة الثانية', content: 'يعيش العصفور في العش'),
  ],
  'ص': [
    Story(title: 'الجملة الأولى', content: 'أكل الحلوى في صحن'),
    Story(title: 'الجملة الثانية', content: 'يقص محمد الورق بالمقص'),
  ],
  'ض': [
    Story(title: 'الجملة الأولى', content: 'الضفدع لونه أخضر'),
    Story(title: 'الجملة الثانية', content: 'أنا أكل الخضار والبيض'),
    Story(title: 'الجملة الثالثة', content: 'الخضار مفيده للجسم'),
  ],
  'ط': [
    Story(title: 'الجملة الأولى', content: 'الطيارة تطير في السما'),
    Story(title: 'الجملة الثانية', content: 'تسبح البطة في البحيرة'),
    Story(title: 'الجملة الثالثة', content: 'تلعب القطوة بالخيط'),
  ],
  'ظ': [
    Story(title: 'الجملة الأولى', content: 'ظل الشجرة جميل'),
    Story(title: 'الجملة الثانية', content: 'محمد يلبس نظارة'),
    Story(title: 'الجملة الثالثة', content: 'محمد يحفظ القرأن'),
  ],
  'ع': [
    Story(title: 'الجملة الأولى', content: 'النحلة تعطينا عسل'),
    Story(title: 'الجملة الثانية', content: 'لون المربع ازرق'),
  ],
  'غ': [
    Story(title: 'الجملة الأولى', content: 'غزال فازت في السباق'),
    Story(title: 'الجملة الثانية', content: 'استخدم محمد صمغ في المدرسة'),
    Story(title: 'الجملة الثالثة', content: 'شرا محمد صمغ جديد'),
  ],
  'ف': [
    Story(title: 'الجملة الأولى', content: 'أذون الفيل كبيره'),
    Story(title: 'الجملة الثانية', content: 'خروف العيد شكلة جميل'),
    Story(title: 'الجملة الثالثة', content: 'فهد يفتح الباب بالمفتاح'),
  ],
  'ق': [
    Story(title: 'الجملة الأولى', content: 'شريت قلم ازرق'),
    Story(title: 'الجملة الثانية', content: 'شربت عصير البرتقال'),
    Story(title: 'الجملة الثالثة', content: 'لبست دلاق في الشتاء'),
  ],
  'ك': [
    Story(title: 'الجملة الأولى', content: 'شرا أحمد كره يديده'),
    Story(title: 'الجملة الثانية', content: 'درست كوثر في مكتبة المدرسه'),
  ],
  'ل': [
    Story(title: 'الجملة الأولى', content: 'شربت ليلى عصير ليمون'),
    Story(title: 'الجملة الثانية', content: 'شرت أمي تلفون جديد'),
  ],
  'م': [
    Story(title: 'الجملة الأولى', content: 'محمد ياكل موز و رمان'),
    Story(title: 'الجملة الثانية', content: 'أنا اكتب بقلم الرصاص'),
    Story(title: 'الجملة الثالثة', content: 'محمد يكتب بقلم الرصاص'),
  ],
  'ن': [
    Story(title: 'الجملة الأولى', content: 'النحلة تصنع العسل'),
    Story(title: 'الجملة الثانية', content: 'نام ناصر مبجر'),
  ],
  'هـ': [
    Story(title: 'الجملة الأولى', content: 'فازت مريم بهديه كبيره'),
    Story(title: 'الجملة الثانية', content: 'ليلى مهندسه شاطره'),
  ],
  'و': [
    Story(title: 'الجملة الأولى', content: 'وردة حمره لونها حلو'),
    Story(title: 'الجملة الثانية', content: 'أحب أكل فراولة مع الككاو'),
    Story(title: 'الجملة الثالثة', content: 'زينه تحب تاكل فراولة'),
    Story(title: 'الجملة الرابعة', content: 'فراولة لونها أحمر'),
  ],
  'ي': [
    Story(title: 'الجملة الأولى', content: 'يسبح يوسف في البحر'),
    Story(title: 'الجملة الثانية', content: 'يوسف يزرع خيار'),
    Story(title: 'الجملة الثالثة', content: 'شرا يدي كرتون خيار'),
    Story(title: 'الجملة الرابعة', content: 'رسمت ياسمين كرسي صغير'),
  ],
};