import 'package:flutter/material.dart';
import 'dart:math' as math;

class SecondScreen extends StatefulWidget {
  List<Book> items;

  SecondScreen({super.key})
      : items = List<Book>.from({
          Book(
              "https://s1.livelib.ru/boocover/1003317448/o/2954/Dzhoan_Rouling__Garri_Potter_i_uznik_Azkabana.jpeg",
              "Гарри Поттер и узник Азкабана",
              "Гарри взрослеет, и вместе с тем жить в Хогвартсе всё страшнее. Из тюрьмы для волшебников Азкабан сбежал опасный преступник - Сириус Блэк. Мир наполнился слухами, что он ищет и хочет убить одного тринадцатилетнего парня, совсем обычного на первый взгляд. Его имя - Гарри Поттер."),
          Book(
              "https://s1.livelib.ru/boocover/1000966838/o/7df1/Stiven_King__Zeljonaya_milya.jpeg",
              "Зелёная миля",
              "Стивен Кинг приглашает читателей в жуткий мир тюремного блока смертников, откуда уходят, чтобы не вернуться, приоткрывает дверь последнего пристанища тех, кто преступил не только человеческий, но и Божий закон. По эту сторону электрического стула нет более смертоносного местечка!"),
          Book(
              "https://s1.livelib.ru/boocover/1003634473/o/3ca5/Margaret_Mitchell__Unesennye_vetrom.jpeg",
              "Унесенные ветром",
              "Роман Маргарет Митчелл вышел в свет в 1936 году и имел феноменальный успех у читателей. Только в первые годы его тираж превысил три миллиона, и «Унесенные ветром» были признаны «книгой века». В 1939 году на экраны вышел одноименный фильм (с участием Вивьен Ли и Кларком Гейблом), который завоевал восемь премий «Оскар» и стал одной из самых кассовых лент в истории кинематографа."),
          Book(
              "https://s1.livelib.ru/boocover/1000496726/o/3ef1/Ketrin_Stokett__Prisluga.jpeg",
              "Прислуга",
              "Американский Юг, на дворе 1960-е годы. Скитер только-только закончила университет и возвращается домой, в сонный городок Джексон, где никогда ничего не происходит. Она мечтает стать писательницей, вырваться в большой мир."),
          Book(
              "https://s1.livelib.ru/boocover/1000453410/o/6118/Dzhon_R._R._Tolkien__Vozvraschenie_gosudarya.jpeg",
              "Возвращение государя",
              "В четвертый том собрания сочинений Дж. Р. Р. Толкиена вошла заключительная летопись сказочной трилогии \"Властелин Колец\" \"Возвращение государя\", из которой юный читатель узнает о последней битве светлых и темных сил, о дальнейшей судьбе Фродо, Сэма, Арагорна и других полюбившихся героев."),
        });

  @override
  State<StatefulWidget> createState() {
    return _SecondScreen();
  }
}

class _SecondScreen extends State<SecondScreen> {
  List<Book> books = List.empty();
  Color bgColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    books = widget.items;
  }

  void changeColor() {
    setState(() {
      bgColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
    });
  }

  removeBook(bookName) {
    setState(() {
      books.removeWhere((element) => element.name == bookName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final item = books[index];
        return TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                  )
              )
          ),
          onPressed: changeColor,
          onLongPress: () => removeBook(item.name),
          child: Row(
            children: [
              Image.network(
                item.urlImage,
                width: 130,
                height: 230,
              ),
              Expanded(
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.desc),
                  )
              )
            ],
          )
        );
      },
    );
  }
}

class Book {
  final String urlImage;
  final String name;
  final String desc;

  Book(this.urlImage, this.name, this.desc);
}
