import 'package:flutter/material.dart';

class Sentence {
  final String order; // e.g., 'الجملة الأولى'
  final String content;

  Sentence({required this.order, required this.content});
}


final Map<String, List<Sentence>> sentencesByLetter = {

  'أ': [
    Sentence(order: 'الجملة الأولى', content: 'الأرنب ياكل جزر'),
  ],
  'ب': [
    Sentence(order: 'الجملة الأولى', content: 'خافت البطه من الدب و تركت الخبز'),
  ],
  'ت': [
    Sentence(order: 'الجملة الأولى', content: 'افتح العلبة لتأكل التوت'),
  ],
  'ث': [
    Sentence(order: 'الجملة الأولى', content: 'لدى ثلاث ألعاب على شكل مثلث'),

  ],
  'ج': [
    Sentence(order: 'الجملة الأولى', content: 'صنعت رجل من الثلج'),
    Sentence(order: 'الجملة الثانية', content: 'لعبت جميله تحت الشجرة'),
  ],
  'ح': [
    Sentence(order: 'الجملة الأولى', content: 'حمد يركب السيارة و يفتح النافذة'),
  ],
  'خ': [
    Sentence(order: 'الجملة الأولى', content: 'خالد يجمع البطيخ مع والده'),
  ],
  'د': [
    Sentence(order: 'الجملة الأولى', content: 'قدمت دلال هديه فيها شيء مفيد '),
  ],
  'ذ': [
    Sentence(order: 'الجملة الأولى', content: 'أخذ خالد ذرة لذيذه '),
  ],
  'ر': [
    Sentence(order: 'الجملة الأولى', content: 'ريم شربت عصير جزر'),
  ],
  'ز': [
    Sentence(order: 'الجملة الأولى', content: 'أكلت مريم رز مع جزر ، وجلست بالقرب من الزهرة'),
  ],
  'س': [
    Sentence(order: 'الجملة الأولى', content: 'ساره ذهبت الى المسجد بعد الدرس '),
  ],
  'ش': [
    Sentence(order: 'الجملة الأولى', content: 'شهد رسمت شجرة فيها عش'),
  ],
  'ص': [
    Sentence(order: 'الجملة الأولى', content: 'صالح يقص الورق بالمقص ويستخدم المصباح'),
    
  ],
  'ض': [
    Sentence(order: 'الجملة الأولى', content: 'ضاري يأكل الخضار و البيض'),

  ],
  'ط': [
    Sentence(order: 'الجملة الأولى', content: 'رأي طارق طائرا يطير فوق البط'),

  ],
  'ظ': [
    Sentence(order: 'الجملة الأولى', content: 'جلس أحمد الظهر ليحفظ الدرس بنظارته'),

  ],
  'ع': [
    Sentence(order: 'الجملة الأولى', content: 'يلعب علي داخل المربع الازرق'),
  ],
  'غ': [
    Sentence(order: 'الجملة الأولى', content: 'غزال صغير فاز بالسباق'),
    Sentence(order: 'الجملة الثانية', content: 'استخدم محمد صمغ في المدرسة'),
  ],
  'ف': [
    Sentence(order: 'الجملة الأولى', content: 'رأي فهد فيل و خروف في الحديقة'),

  ],
  'ق': [
    Sentence(order: 'الجملة الأولى', content: 'شريت قلم ازرق'),
    Sentence(order: 'الجملة الثانية', content: 'شربت عصير البرتقال'),
  ],
  'ك': [
    Sentence(order: 'الجملة الأولى', content: 'قرأت كوثر فقصة عن ملك في المكتبة'),
  ],
  'ل': [
    Sentence(order: 'الجملة الأولى', content: 'أكلت ليلى خبزا مع عسل و شربت عصير ليمون'),
  
  ],
  'م': [
    Sentence(order: 'الجملة الأولى', content: 'محمد يكتب بقلم الرصاص'),
  ],
  'ن': [
    Sentence(order: 'الجملة الأولى', content: 'النحلة تصنع العسل'),
    Sentence(order: 'الجملة الثانية', content: 'نام سلطان مبكرا'),
  ],
  'هـ': [
    Sentence(order: 'الجملة الأولى', content: 'فازت هنادي بهديه كبيره'),
  ],
  'و': [
    Sentence(order: 'الجملة الأولى', content: 'ولد يأكل فراولة مع الكاكاو'),
  ],
  'ي': [
    Sentence(order: 'الجملة الأولى', content: 'يزرع صديقي خيار'),
  ],
};