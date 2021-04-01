users = User.create!([
  {name: :Alexey, admin: 1, email: 'lukashevich2211@gmail.com'},
  {name: :Egor, admin: 0, email: 'qwerty24164444@gmail.com'},
  {name: :Nastya, admin: 0, email: '123qwe@yandex.ru'}
  ])

categories = Category.create!([
  {title: :Backend},
  {title: :Frontend},
  {title: :DevOps}
])

tests = Test.create!([
  {title: :Ruby, level: 2, category: categories[0]},
  {title: :HTML, level: 0, category: categories[1]},
  {title: :SQL, level: 0, category: categories[0]},
  {title: :Linux, level: 3, category: categories[2]},
  {title: :Rails, level: 1, category: categories[0]}
])

questions = Question.create!([
  {body: 'Какие есть способы объявления хешей?', test: tests[0]},
  {body: 'Какая типизации в Ruby', test: tests[0]},
  {body: 'Какой тег используется для того, чтобы гиперссылка открывалась в новой вкладке?', test: tests[1]},
  {body: 'Какие категории SQL можно выделить', test: tests[2]},
  {body: 'Приведите последовательность обработки http запроса приложением Rails', test: tests[4]},
  {body: 'Основные компоненты Linux', test: tests[3]}
])

answers = Answer.create!([
  {body: 'a = {},  a = Hash.new , a= Hash[]', question: questions[0]},
  {body: 'Ruby имеет динамическую, строгую, неявную типизацию', question: questions[1]},
  {body: 'Для того, чтобы ссылка открывалась в новом окне используется тег <_blank>', question: questions[2]},
  {body: 'В SQL можно выделить категории: DDL - Data Definition Language и DML Data Manipulation Language', question: questions[3]},
  {body: 'сервер - роутер - контроллер - модель - БД - модель - контроллер - представление - контроллер - сервер', question: questions[4]},
  {body: 'Ядро, системные библиотеки, системные утилиты', question: questions[5]}
])
