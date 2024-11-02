type Question = {
  text: string;
  correctIndex: number;
  answers: string[];
}

export const questions: Question[] = [
  {
    text: "Które z tych miast jest stolicą Polski?",
    correctIndex: 0,
    answers: ["Warszawa", "Kraków", "Gdańsk", "Wrocław"]
  },
  {
    text: "Która planeta jest najbliżej Słońca?",
    correctIndex: 3,
    answers: ["Mars", "Wenus", "Ziemia", "Merkury"]
  },
  {
    text: "Kto napisał 'Pana Tadeusza'?",
    correctIndex: 0,
    answers: ["Adam Mickiewicz", "Henryk Sienkiewicz", "Juliusz Słowacki", "Bolesław Prus"]
  },
  {
    text: "Jaki jest symbol chemiczny dla złota?",
    correctIndex: 1,
    answers: ["Ag", "Au", "Fe", "Cu"]
  },
  {
    text: "Jak nazywa się najwyższy szczyt Tatr?",
    correctIndex: 2,
    answers: ["Kasprowy Wierch", "Giewont", "Rysy", "Kościelec"]
  },
  {
    text: "Który ocean jest największy?",
    correctIndex: 3,
    answers: ["Ocean Atlantycki", "Ocean Arktyczny", "Ocean Indyjski", "Ocean Spokojny"]
  },
  {
    text: "W którym roku Polska przystąpiła do Unii Europejskiej?",
    correctIndex: 2,
    answers: ["1999", "2000", "2004", "2007"]
  },
  {
    text: "Jak nazywa się stolica Włoch?",
    correctIndex: 3,
    answers: ["Paryż", "Madryt", "Londyn", "Rzym"]
  },
  {
    text: "Jakie zwierzę jest symbolem WWF?",
    correctIndex: 1,
    answers: ["Słoń", "Panda", "Tygrys", "Orzeł"]
  },
  {
    text: "Kto jest autorem teorii względności?",
    correctIndex: 0,
    answers: ["Albert Einstein", "Isaac Newton", "Marie Curie", "Niels Bohr"]
  },
  {
    text: "Które miasto jest stolicą Francji?",
    correctIndex: 1,
    answers: ["Berlin", "Paryż", "Rzym", "Londyn"]
  },
  {
    text: "Jak nazywa się największe jezioro w Polsce?",
    correctIndex: 2,
    answers: ["Jezioro Solińskie", "Jezioro Gopło", "Jezioro Śniardwy", "Jezioro Mamry"]
  },
  {
    text: "Kto jest autorem obrazu 'Mona Lisa'?",
    correctIndex: 3,
    answers: ["Vincent van Gogh", "Pablo Picasso", "Claude Monet", "Leonardo da Vinci"]
  },
  {
    text: "Który pierwiastek jest najlżejszy?",
    correctIndex: 0,
    answers: ["Wodór", "Hel", "Tlen", "Azot"]
  },
  {
    text: "Jak nazywa się największy kontynent na świecie?",
    correctIndex: 1,
    answers: ["Afryka", "Azja", "Europa", "Ameryka Północna"]
  },
  {
    text: "W którym roku wybuchła I wojna światowa?",
    correctIndex: 2,
    answers: ["1905", "1919", "1914", "1939"]
  },
  {
    text: "Które zwierzę jest symbolem Chin?",
    correctIndex: 3,
    answers: ["Orzeł", "Krokodyl", "Panda", "Smok"]
  },
  {
    text: "Kto jest autorem książki 'Lalka'?",
    correctIndex: 2,
    answers: ["Adam Mickiewicz", "Juliusz Słowacki", "Bolesław Prus", "Stefan Żeromski"]
  },
  {
    text: "Ile wynosi liczba Pi (zaokrąglona do dwóch miejsc po przecinku)?",
    correctIndex: 1,
    answers: ["3,12", "3,14", "3,16", "3,18"]
  },
  {
    text: "Który kraj jest największy pod względem powierzchni?",
    correctIndex: 0,
    answers: ["Rosja", "Kanada", "Chiny", "Stany Zjednoczone"]
  },
  {
    text: "Jakie państwo wygrało Mistrzostwa Świata w Piłce Nożnej w 2018 roku?",
    correctIndex: 1,
    answers: ["Niemcy", "Francja", "Brazylia", "Hiszpania"]
  },
  {
    text: "Które polskie miasto nazywane jest 'Wenecją Północy'?",
    correctIndex: 2,
    answers: ["Poznań", "Kraków", "Gdańsk", "Wrocław"]
  },
  {
    text: "Jakie zwierzę jest największe na świecie?",
    correctIndex: 0,
    answers: ["Płetwal błękitny", "Słoń afrykański", "Rekin wielorybi", "Kałamarnica olbrzymia"]
  },
  {
    text: "Który film zdobył najwięcej Oscarów w historii?",
    correctIndex: 3,
    answers: ["Titanic", "Avatar", "Władca Pierścieni", "Ben-Hur"]
  },
  {
    text: "Jakie są kolory flagi Niemiec?",
    correctIndex: 2,
    answers: ["Niebieski, Biały, Czerwony", "Zielony, Żółty, Czerwony", "Czarny, Czerwony, Żółty", "Biały, Czerwony, Niebieski"]
  },
  {
    text: "Która planeta w Układzie Słonecznym jest największa?",
    correctIndex: 0,
    answers: ["Jowisz", "Saturn", "Uran", "Neptun"]
  },
  {
    text: "Kto odkrył Amerykę?",
    correctIndex: 2,
    answers: ["James Cook", "Ferdynand Magellan", "Krzysztof Kolumb", "Vasco da Gama"]
  },
  {
    text: "W jakim kraju wynaleziono makaron?",
    correctIndex: 1,
    answers: ["Włochy", "Chiny", "Indie", "Egipt"]
  },
  {
    text: "Jaką walutę używa Japonia?",
    correctIndex: 0,
    answers: ["Jen", "Won", "Peso", "Yuan"]
  },
  {
    text: "Która rzeka jest najdłuższa na świecie?",
    correctIndex: 1,
    answers: ["Amazonka", "Nil", "Jangcy", "Missisipi"]
  },
  {
    text: "Które miasto jest stolicą Hiszpanii?",
    correctIndex: 2,
    answers: ["Barcelona", "Walencja", "Madryt", "Sewilla"]
  },
  {
    text: "Kto napisał 'Quo Vadis'?",
    correctIndex: 1,
    answers: ["Juliusz Słowacki", "Henryk Sienkiewicz", "Adam Mickiewicz", "Bolesław Prus"]
  },
  {
    text: "Jakie jest najgłębsze jezioro na świecie?",
    correctIndex: 3,
    answers: ["Jezioro Wiktorii", "Jezioro Tanganika", "Jezioro Górne", "Jezioro Bajkał"]
  },
  {
    text: "W jakim roku upadł Mur Berliński?",
    correctIndex: 0,
    answers: ["1989", "1991", "1985", "1979"]
  },
  {
    text: "Kto namalował 'Gwiezdną Noc'?",
    correctIndex: 2,
    answers: ["Pablo Picasso", "Leonardo da Vinci", "Vincent van Gogh", "Claude Monet"]
  },
  {
    text: "Jakie jest największe państwo w Ameryce Południowej?",
    correctIndex: 1,
    answers: ["Argentyna", "Brazylia", "Chile", "Kolumbia"]
  },
  {
    text: "Jak nazywa się najdłuższa rzeka w Polsce?",
    correctIndex: 0,
    answers: ["Wisła", "Odra", "Warta", "Bug"]
  },
  {
    text: "Ile jest planet w Układzie Słonecznym?",
    correctIndex: 2,
    answers: ["7", "8", "9", "10"]
  },
  {
    text: "Jaką walutę używa Wielka Brytania?",
    correctIndex: 3,
    answers: ["Euro", "Dolar", "Frank", "Funt"]
  },
  {
    text: "Jaki gaz jest niezbędny do oddychania?",
    correctIndex: 1,
    answers: ["Wodór", "Tlen", "Dwutlenek węgla", "Azot"]
  },
  {
    text: "Jak nazywa się najwyższy budynek na świecie?",
    correctIndex: 0,
    answers: ["Burj Khalifa", "Shanghai Tower", "Empire State Building", "Eiffel Tower"]
  },
  {
    text: "Kto jest twórcą teorii ewolucji?",
    correctIndex: 3,
    answers: ["Gregor Mendel", "Isaac Newton", "Galileo Galilei", "Charles Darwin"]
  },
  {
    text: "Jakie zwierzę symbolizuje Stany Zjednoczone?",
    correctIndex: 2,
    answers: ["Wilk", "Bizon", "Bielik amerykański", "Niedźwiedź grizzly"]
  },
  {
    text: "W jakim mieście znajduje się Wieża Eiffla?",
    correctIndex: 1,
    answers: ["Rzym", "Paryż", "Londyn", "Madryt"]
  },
  {
    text: "Kto jest autorem książki 'W pustyni i w puszczy'?",
    correctIndex: 2,
    answers: ["Juliusz Słowacki", "Bolesław Prus", "Henryk Sienkiewicz", "Stefan Żeromski"]
  },
  {
    text: "Jak nazywa się największy ocean na świecie?",
    correctIndex: 3,
    answers: ["Ocean Atlantycki", "Ocean Arktyczny", "Ocean Indyjski", "Ocean Spokojny"]
  },
  {
    text: "W jakim kraju znajduje się Machu Picchu?",
    correctIndex: 1,
    answers: ["Boliwia", "Peru", "Meksyk", "Argentyna"]
  },
  {
    text: "Ile nóg ma pająk?",
    correctIndex: 0,
    answers: ["8", "6", "10", "12"]
  },
  {
    text: "Które miasto jest stolicą Japonii?",
    correctIndex: 1,
    answers: ["Kioto", "Tokio", "Osaka", "Nagasaki"]
  },
  {
    text: "Kto był pierwszym człowiekiem, który stanął na Księżycu?",
    correctIndex: 2,
    answers: ["Yuri Gagarin", "Buzz Aldrin", "Neil Armstrong", "Michael Collins"]
  }
];