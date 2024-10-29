class QuizQuestion {
  QuizQuestion({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });

  final String text;
  final List<String> answers;
  final int correctIndex;

  static int getQuestionAmount() {
    return getAllQuestions().length;
  }

  static List<QuizQuestion> getRandomQuestionsSubset(int amount) {
    List<QuizQuestion> questions = getAllQuestions();
    questions.shuffle();
    return questions.sublist(0, amount);
  }

  static List<QuizQuestion> getAllQuestions() {
    return <QuizQuestion>[
      QuizQuestion(
        text: 'Które z miast jest stolicą Polski?',
        answers: <String>['Warszawa', 'Kraków', 'Gdańsk', 'Wrocław'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Która planeta jest najbliżej Słońca?',
        answers: <String>['Mars', 'Wenus', 'Ziemia', 'Merkury'],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Kto napisał "Pana Tadeusza"?',
        answers: <String>[
          'Adam Mickiewicz',
          'Henryk Sienkiewicz',
          'Juliusz Słowacki',
          'Bolesław Prus'
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Jaki jest symbol chemiczny dla złota?',
        answers: <String>['Ag', 'Au', 'Fe', 'Cu'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jak nazywa się najwyższy szczyt Tatr?',
        answers: <String>['Kasprowy Wierch', 'Giewont', 'Rysy', 'Kościelec'],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Który ocean jest największy?',
        answers: <String>[
          'Ocean Atlantycki',
          'Ocean Arktyczny',
          'Ocean Indyjski',
          'Ocean Spokojny'
        ],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'W którym roku Polska przystąpiła do Unii Europejskiej?',
        answers: <String>['1999', '2000', '2004', '2007'],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Jak nazywa się stolica Włoch?',
        answers: <String>['Paryż', 'Madryt', 'Londyn', 'Rzym'],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Jakie zwierzę jest symbolem WWF?',
        answers: <String>['Słoń', 'Panda', 'Tygrys', 'Orzeł'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Kto jest autorem teorii względności?',
        answers: <String>[
          'Albert Einstein',
          'Isaac Newton',
          'Marie Curie',
          'Niels Bohr'
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Które miasto jest stolicą Francji?',
        answers: <String>['Berlin', 'Paryż', 'Rzym', 'Londyn'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jak nazywa się największe jezioro w Polsce?',
        answers: <String>[
          'Jezioro Solińskie',
          'Jezioro Gopło',
          'Jezioro Śniardwy',
          'Jezioro Mamry'
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Kto jest autorem obrazu "Mona Lisa"?',
        answers: <String>[
          'Vincent van Gogh',
          'Pablo Picasso',
          'Claude Monet',
          'Leonardo da Vinci'
        ],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Który pierwiastek jest najlżejszy?',
        answers: <String>['Wodór', 'Hel', 'Tlen', 'Azot'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Jak nazywa się największy kontynent na świecie?',
        answers: <String>['Afryka', 'Azja', 'Europa', 'Ameryka Północna'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'W którym roku wybuchła I wojna światowa?',
        answers: <String>['1905', '1919', '1914', '1939'],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Które zwierzę jest symbolem Chin?',
        answers: <String>['Orzeł', 'Krokodyl', 'Panda', 'Smok'],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Kto jest autorem książki "Lalka"?',
        answers: <String>[
          'Adam Mickiewicz',
          'Juliusz Słowacki',
          'Bolesław Prus',
          'Stefan Żeromski'
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        text:
            'Ile wynosi liczba Pi (zaokrąglona do dwóch miejsc po przecinku)?',
        answers: <String>['3,12', '3,14', '3,16', '3,18'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Który kraj jest największy pod względem powierzchni?',
        answers: <String>['Rosja', 'Kanada', 'Chiny', 'Stany Zjednoczone'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text:
            'Jakie państwo wygrało Mistrzostwa Świata w Piłce Nożnej w 2018 roku?',
        answers: <String>['Niemcy', 'Francja', 'Brazylia', 'Hiszpania'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Które polskie miasto nazywane jest "Wenecją Północy"?',
        answers: <String>['Poznań', 'Kraków', 'Gdańsk', 'Wrocław'],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Jakie zwierzę jest największe na świecie?',
        answers: <String>[
          'Płetwal błękitny',
          'Słoń afrykański',
          'Rekin wielorybi',
          'Kałamarnica olbrzymia'
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Który film zdobył najwięcej Oscarów w historii?',
        answers: <String>['Titanic', 'Avatar', 'Władca Pierścieni', 'Ben-Hur'],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Jakie są kolory flagi Niemiec?',
        answers: <String>[
          'Niebieski, Biały, Czerwony',
          'Zielony, Żółty, Czerwony',
          'Czarny, Czerwony, Żółty',
          'Biały, Czerwony, Niebieski'
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Która planeta w Układzie Słonecznym jest największa?',
        answers: <String>['Jowisz', 'Saturn', 'Uran', 'Neptun'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Kto odkrył Amerykę?',
        answers: <String>[
          'James Cook',
          'Ferdynand Magellan',
          'Krzysztof Kolumb',
          'Vasco da Gama'
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'W jakim kraju wynaleziono makaron?',
        answers: <String>['Włochy', 'Chiny', 'Indie', 'Egipt'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jaką walutę używa Japonia?',
        answers: <String>['Jen', 'Won', 'Peso', 'Yuan'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Która rzeka jest najdłuższa na świecie?',
        answers: <String>['Amazonka', 'Nil', 'Jangcy', 'Missisipi'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Które miasto jest stolicą Hiszpanii?',
        answers: <String>['Barcelona', 'Walencja', 'Madryt', 'Sewilla'],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Kto napisał "Quo Vadis"?',
        answers: <String>[
          'Juliusz Słowacki',
          'Henryk Sienkiewicz',
          'Adam Mickiewicz',
          'Bolesław Prus'
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jakie jest najgłębsze jezioro na świecie?',
        answers: <String>[
          'Jezioro Wiktorii',
          'Jezioro Tanganika',
          'Jezioro Górne',
          'Jezioro Bajkał'
        ],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'W jakim roku upadł Mur Berliński?',
        answers: <String>['1989', '1991', '1985', '1979'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Kto namalował obraz "Gwiazda" (Starry Night)?',
        answers: <String>[
          'Pablo Picasso',
          'Vincent van Gogh',
          'Claude Monet',
          'Salvador Dali'
        ],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jakie jest największe państwo w Ameryce Południowej?',
        answers: <String>['Argentyna', 'Brazylia', 'Chile', 'Kolumbia'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jak nazywa się najdłuższa rzeka w Polsce?',
        answers: <String>['Wisła', 'Odra', 'Warta', 'Bug'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Ile jest planet w Układzie Słonecznym?',
        answers: <String>['7', '8', '9', '10'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jaką walutę używa Wielka Brytania?',
        answers: <String>['Euro', 'Dolar', 'Frank', 'Funt'],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Jaki gaz jest niezbędny do oddychania?',
        answers: <String>['Wodór', 'Tlen', 'Dwutlenek węgla', 'Azot'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Jak nazywa się najwyższy budynek na świecie?',
        answers: <String>[
          'Burj Khalifa',
          'Shanghai Tower',
          'Empire State Building',
          'Eiffel Tower'
        ],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Kto jest twórcą teorii ewolucji?',
        answers: <String>[
          'Gregor Mendel',
          'Isaac Newton',
          'Galileo Galilei',
          'Charles Darwin'
        ],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'Jakie zwierzę symbolizuje Stany Zjednoczone?',
        answers: <String>[
          'Wilk',
          'Bizon',
          'Bielik amerykański',
          'Niedźwiedź grizzly'
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'W jakim mieście znajduje się Wieża Eiffla?',
        answers: <String>['Rzym', 'Paryż', 'Londyn', 'Madryt'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Kto jest autorem książki "W pustyni i w puszczy"?',
        answers: <String>[
          'Juliusz Słowacki',
          'Bolesław Prus',
          'Henryk Sienkiewicz',
          'Stefan Żeromski'
        ],
        correctIndex: 2,
      ),
      QuizQuestion(
        text: 'Jak nazywa się największy ocean na świecie?',
        answers: <String>[
          'Ocean Atlantycki',
          'Ocean Arktyczny',
          'Ocean Indyjski',
          'Ocean Spokojny'
        ],
        correctIndex: 3,
      ),
      QuizQuestion(
        text: 'W jakim kraju znajduje się Machu Picchu?',
        answers: <String>['Boliwia', 'Peru', 'Meksyk', 'Argentyna'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Ile nóg ma pająk?',
        answers: <String>['8', '6', '10', '12'],
        correctIndex: 0,
      ),
      QuizQuestion(
        text: 'Które miasto jest stolicą Japonii?',
        answers: <String>['Kioto', 'Tokio', 'Osaka', 'Nagasaki'],
        correctIndex: 1,
      ),
      QuizQuestion(
        text: 'Kto był pierwszym człowiekiem, który stanął na Księżycu?',
        answers: <String>[
          'Yuri Gagarin',
          'Buzz Aldrin',
          'Neil Armstrong',
          'Michael Collins'
        ],
        correctIndex: 2,
      ),
    ];
  }
}
