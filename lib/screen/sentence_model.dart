import 'package:flutter/material.dart';

class Sentence {
  final String order; // e.g., 'الجملة الأولى'
  final String content;

  Sentence({required this.order, required this.content});
}


final Map<String, List<Sentence>> sentencesByLetter = {

  'أ': [
    Sentence(order: 'الجملة الأولى', content: 'أرنب ياكل جزر'),
  ],
  'ب': [
    Sentence(order: 'الجملة الأولى', content: 'خافت البطه من الدب و خلت الخبز'),
  ],
  'ت': [
    Sentence(order: 'الجملة الأولى', content: 'افتح العلبة عشان تاكل التوت'),
  ],
  'ث': [
    Sentence(order: 'الجملة الأولى', content: 'عندي ثلاث ألعاب على شكل مثلث'),

  ],
  'ج': [
    Sentence(order: 'الجملة الأولى', content: 'سويت رجل من الثلج'),
    Sentence(order: 'الجملة الثانية', content: 'لعبت جميله تحت الشجرة'),
  ],
  'ح': [
    Sentence(order: 'الجملة الأولى', content: 'حمد يركب السيارة و يفتح الدريشه'),
  ],
  'خ': [
    Sentence(order: 'الجملة الأولى', content: 'خالد يجمع البطيخ مع ابوه'),
  ],
  'د': [
    Sentence(order: 'الجملة الأولى', content: 'قدمت دلال هديه فيها شي مفيد '),
  ],
  'ذ': [
    Sentence(order: 'الجملة الأولى', content: 'أخذ خالد الذرة  '),
  ],
  'ر': [
    Sentence(order: 'الجملة الأولى', content: 'ريم شربت عصير جزر'),
  ],
  'ز': [
    Sentence(order: 'الجملة الأولى', content: 'زرعت مريم جزر في الحديقة ، وقعدت تاكل جوز '),
  ],
  'س': [
    Sentence(order: 'الجملة الأولى', content: 'ساره راحت المسجد بعد الدرس '),
  ],
  'ش': [
    Sentence(order: 'الجملة الأولى', content: 'شهد رسمت شجرة فيها عش'),
  ],
  'ص': [
    Sentence(order: 'الجملة الأولى', content: 'صالح قص الورقه بالمقص بعد ما شرب العصير '),
    
  ],
  'ض': [
    Sentence(order: 'الجملة الأولى', content: 'ضاري ياكل الخضار و البيض'),

  ],
  'ط': [
    Sentence(order: 'الجملة الأولى', content: 'شاف طارق طير يطير فوق البط'),

  ],
  'ظ': [
    Sentence(order: 'الجملة الأولى', content: 'قعد أحمد الظهر وحفظ الدرس بنظارته'),

  ],
  'ع': [
    Sentence(order: 'الجملة الأولى', content: 'يلعب علي داخل المربع الازرق'),
  ],
  'غ': [
    Sentence(order: 'الجملة الأولى', content: 'غزال صغير فاز بالسباق'),
    Sentence(order: 'الجملة الثانية', content: 'شري محمد صمغ يديد حق المدرسة'),
  ],
  'ف': [
    Sentence(order: 'الجملة الأولى', content: 'شاف فهد فيل و خروف في الحديقة'),

  ],
  'ق': [
    Sentence(order: 'الجملة الأولى', content: 'شريت قلم ازرق'),
    Sentence(order: 'الجملة الثانية', content: 'شربت عصير البرتقال'),
  ],
  'ك': [
    Sentence(order: 'الجملة الأولى', content: 'قرت كوثر قصة عن ملك في المكتبة'),
  ],
  'ل': [
    Sentence(order: 'الجملة الأولى', content: 'كلت ليلى الخبز مع عسل و شربت عصير ليمون'),
  
  ],
  'م': [
    Sentence(order: 'الجملة الأولى', content: 'محمد يكتب بقلم الرصاص'),
  ],
  'ن': [
    Sentence(order: 'الجملة الأولى', content: 'ناخذ العسل من النحل'),
    Sentence(order: 'الجملة الثانية', content: 'نام سلطان مبجر'),
  ],
  'هـ': [
    Sentence(order: 'الجملة الأولى', content: 'فازت هنادي بهديه كبيره'),
  ],
  'و': [
    Sentence(order: 'الجملة الأولى', content: 'الولد ياكل فراولة مع الكاكاو'),
  ],
  'ي': [
    Sentence(order: 'الجملة الأولى', content: 'يزرع رفيجي خيار بالمزرعه'),
  ],
};