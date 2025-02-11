import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  Widget buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 147, 175, 217),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 3, 33, 79),
          thickness: 2,
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 3, 33, 79),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // تعريف محتويات الأقسام
    const String introduction =
        "تم تطوير هذا التطبيق لتقديم استشارات قانونية متخصصة في مجال الأحوال الشخصية، وذلك باستخدام تقنية الذكاء الاصطناعي. يهدف التطبيق إلى مساعدة الأفراد في الحصول على إجابات دقيقة حول قضايا مثل الزواج، الطلاق، الحضانة، والنفقة، بطريقة سهلة وسريعة مع الحفاظ على الخصوصية. إن استخدامك لهذا التطبيق يعني موافقتك على الشروط والأحكام المنظمة له، والتي تضمن تقديم الخدمة ضمن بيئة قانونية موثوقة وآمنة.";

    const String usage =
        "يقتصر استخدام التطبيق على تقديم الاستفسارات والحصول على استشارات قانونية متعلقة بقضايا الأحوال الشخصية، وذلك للأغراض الشخصية فقط. التطبيق متاح مجانًا للمستخدمين، ولا يُستخدم لأي أغراض تجارية أو مالية، وفقًا للشروط والأحكام المعتمدة.";

    const String privacyPolicy =
        "نحن نحترم خصوصيتك ونتعهد بحماية بياناتك الشخصية. لن نقوم بمشاركة بياناتك مع أي جهة خارجية دون موافقتك.";

    const String terms =
        "1. يتم حفظ بيانات المستخدم وفقًا للمعايير الأمنية المعتمدة، ولن يتم استخدامها بأي شكل غير قانوني.\n"
        "2. استمرارك في استخدام التطبيق يُعد موافقة ضمنية على جميع التحديثات المستقبلية للشروط والأحكام.\n"
        "3. للاستفادة من خدمات التطبيق، يتعين على المستخدم التسجيل باستخدام بيانات صحيحة وكاملة.";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 33, 79),
          centerTitle: true,
          title: const Text(
            "سياسة الخصوصية والشروط",
            style: TextStyle(color: Colors.white),
          ),
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSection("المقدمة", introduction),
                buildSection("استخدام التطبيق", usage),
                buildSection("سياسة الخصوصية", privacyPolicy),
                buildSection("الشروط والأحكام", terms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
