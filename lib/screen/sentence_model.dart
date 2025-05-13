import 'package:flutter/material.dart';

class Sentence {
  final String order; // e.g., 'الجملة الأولى'
  final String content;

  Sentence({required this.order, required this.content});
}


final Map<String, List<Sentence>> sentencesByLetter = {

  'أ': [
    Sentence(order: 'الجملة الأولى', content: 'الأرنب ياكل جزر'),
    Sentence(order: 'الجملة الثانية', content: 'الأسد ملك الغابة'),
    Sentence(order: 'الجملة الثالثة', content: 'شريت ألوان جديده'),
  ],
  'ب': [
    Sentence(order: 'الجملة الأولى', content: 'تسبح البطة في البحيرة'),
    Sentence(order: 'الجملة الثانية', content: 'تاكل البطة خبز'),
    Sentence(order: 'الجملة الثالثة', content: 'اكل الدب الخبز كله'),
  ],
  'ت': [
    Sentence(order: 'الجملة الأولى', content: 'أفتح باب البيت بالمفتاح'),
    Sentence(order: 'الجملة الثانية', content: 'فهد ياكل تفاح'),
  ],
  'ث': [
    Sentence(order: 'الجملة الأولى', content: 'مثلث لونه أزرق'),
    Sentence(order: 'الجملة الثانية', content: 'نحط الماي داخل الثلاجة'),
  ],
  'ج': [
    Sentence(order: 'الجملة الأولى', content: 'يعيش الجمل في الصحرا'),
    Sentence(order: 'الجملة الثانية', content: 'لعبت جميله تحت الشجرة'),
  ],
  'ح': [
    Sentence(order: 'الجملة الأولى', content: 'الحصان حيوان سريع'),
    Sentence(order: 'الجملة الثانية', content: 'حمد يسبح في البحر'),
    Sentence(order: 'الجملة الثالثة', content: 'يفتح حمد السيارة بالمفتاح'),
  ],
  'خ': [
    Sentence(order: 'الجملة الأولى', content: 'الخروف ياكل العشب والخبز'),
    Sentence(order: 'الجملة الثانية', content: 'خالد يجمع الخرز'),
    Sentence(order: 'الجملة الثالثة', content: 'صليت خمس صلوات في اليوم'),
    Sentence(order: 'الجملة الرابعة', content: 'خالد ياكل البطيخ في الصيف'),
  ],
  'د': [
    Sentence(order: 'الجملة الأولى', content: 'فازت دلال بهدية'),
    Sentence(order: 'الجملة الثانية', content: 'ايد الدب كبيرة'),
    Sentence(order: 'الجملة الثالثة', content: 'يلعب محمد بالدمى'),
  ],
  'ذ': [
    Sentence(order: 'الجملة الأولى', content: 'الذرة لذيذة وايد'),
    Sentence(order: 'الجملة الثانية', content: 'التلميذ يأكل الذرة'),
  ],
  'ر': [
    Sentence(order: 'الجملة الأولى', content: 'شربت عصير رمان و جزر'),
    Sentence(order: 'الجملة الثانية', content: 'رسمت سياره لونها أحمر'),
  ],
  'ز': [
    Sentence(order: 'الجملة الأولى', content: 'زرعت جمانة جزر في الحديقة'),
    Sentence(order: 'الجملة الثانية', content: 'ياكل محمد جزر'),
    Sentence(order: 'الجملة الثالثة', content: 'الزرافة لها رقبه طويلة'),
  ],
  'س': [
    Sentence(order: 'الجملة الأولى', content: 'سمجة لونها برتقالي'),
    Sentence(order: 'الجملة الثانية', content: 'يصلي الولد بالمسيد'),
  ],
  'ش': [
    Sentence(order: 'الجملة الأولى', content: 'الفراشة ألوانها جميلة'),
    Sentence(order: 'الجملة الثانية', content: 'يعيش العصفور في العش'),
  ],
  'ص': [
    Sentence(order: 'الجملة الأولى', content: 'أكل الحلوى في صحن'),
    Sentence(order: 'الجملة الثانية', content: 'يقص محمد الورق بالمقص'),
  ],
  'ض': [
    Sentence(order: 'الجملة الأولى', content: 'الضفدع لونه أخضر'),
    Sentence(order: 'الجملة الثانية', content: 'أنا أكل الخضار والبيض'),
    Sentence(order: 'الجملة الثالثة', content: 'الخضار مفيده للجسم'),
  ],
  'ط': [
    Sentence(order: 'الجملة الأولى', content: 'الطيارة تطير في السما'),
    Sentence(order: 'الجملة الثانية', content: 'تسبح البطة في البحيرة'),
    Sentence(order: 'الجملة الثالثة', content: 'تلعب القطوة بالخيط'),
  ],
  'ظ': [
    Sentence(order: 'الجملة الأولى', content: 'ظل الشجرة جميل'),
    Sentence(order: 'الجملة الثانية', content: 'محمد يلبس نظارة'),
    Sentence(order: 'الجملة الثالثة', content: 'محمد يحفظ القرأن'),
  ],
  'ع': [
    Sentence(order: 'الجملة الأولى', content: 'النحلة تعطينا عسل'),
    Sentence(order: 'الجملة الثانية', content: 'لون المربع ازرق'),
  ],
  'غ': [
    Sentence(order: 'الجملة الأولى', content: 'غزال فازت في السباق'),
    Sentence(order: 'الجملة الثانية', content: 'استخدم محمد صمغ في المدرسة'),
    Sentence(order: 'الجملة الثالثة', content: 'شرا محمد صمغ جديد'),
  ],
  'ف': [
    Sentence(order: 'الجملة الأولى', content: 'أذون الفيل كبيره'),
    Sentence(order: 'الجملة الثانية', content: 'خروف العيد شكلة جميل'),
    Sentence(order: 'الجملة الثالثة', content: 'فهد يفتح الباب بالمفتاح'),
  ],
  'ق': [
    Sentence(order: 'الجملة الأولى', content: 'شريت قلم ازرق'),
    Sentence(order: 'الجملة الثانية', content: 'شربت عصير البرتقال'),
    Sentence(order: 'الجملة الثالثة', content: 'لبست دلاق في الشتاء'),
  ],
  'ك': [
    Sentence(order: 'الجملة الأولى', content: 'شرا أحمد كره يديده'),
    Sentence(order: 'الجملة الثانية', content: 'درست كوثر في مكتبة المدرسه'),
  ],
  'ل': [
    Sentence(order: 'الجملة الأولى', content: 'شربت ليلى عصير ليمون'),
    Sentence(order: 'الجملة الثانية', content: 'شرت أمي تلفون جديد'),
  ],
  'م': [
    Sentence(order: 'الجملة الأولى', content: 'محمد ياكل موز و رمان'),
    Sentence(order: 'الجملة الثانية', content: 'أنا اكتب بقلم الرصاص'),
    Sentence(order: 'الجملة الثالثة', content: 'محمد يكتب بقلم الرصاص'),
  ],
  'ن': [
    Sentence(order: 'الجملة الأولى', content: 'النحلة تصنع العسل'),
    Sentence(order: 'الجملة الثانية', content: 'نام ناصر مبجر'),
  ],
  'هـ': [
    Sentence(order: 'الجملة الأولى', content: 'فازت مريم بهديه كبيره'),
    Sentence(order: 'الجملة الثانية', content: 'ليلى مهندسه شاطره'),
  ],
  'و': [
    Sentence(order: 'الجملة الأولى', content: 'وردة حمره لونها حلو'),
    Sentence(order: 'الجملة الثانية', content: 'أحب أكل فراولة مع الككاو'),
    Sentence(order: 'الجملة الثالثة', content: 'زينه تحب تاكل فراولة'),
    Sentence(order: 'الجملة الرابعة', content: 'فراولة لونها أحمر'),
  ],
  'ي': [
    Sentence(order: 'الجملة الأولى', content: 'يسبح يوسف في البحر'),
    Sentence(order: 'الجملة الثانية', content: 'يوسف يزرع خيار'),
    Sentence(order: 'الجملة الثالثة', content: 'شرا يدي كرتون خيار'),
    Sentence(order: 'الجملة الرابعة', content: 'رسمت ياسمين كرسي صغير'),
  ],
};