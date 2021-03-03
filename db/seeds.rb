users = User.create!([
  {name: :Alexey, admin: 1}
  {name: :Egor, admin: 0}
  {name: :Nastya, admin: 0}
  ])

categories = Category.create!([
  {title: :Backend},
  {title: :Frontend},
  {title: :DevOps}
])

tests = Test.create!([
  {title: :Ruby, level: 2, category_id: categories[0].id},
  {title: :HTML, level: 0, category_id: categories[1].id},
  {title: :SQL, level: 0, category_id: categories[0].id},
  {title: :Linux, level: 3, category_id: categories[2].id},
  {title: :Rails, level: 1, category_id: categories[0].id}
])

questions = Question.create!([
  {body: 'Какие есть способы объявления хешей?', test_id: tests[0].id},
  {body: 'Какая типизации в Ruby', test_id: tests[0].id},
  {body: 'Какой тег используется для того, чтобы гиперссылка открывалась в новой вкладке?', test_id: tests[1].id},
  {body: 'Какие категории SQL можно выделить', test_id: tests[2].id},
  {body: 'Приведите последовательность обработки http запроса приложением Rails', test_id: tests[4].id},
  {body: 'Основные компоненты Linux', test_id: tests[3].id}
])

answers = Answer.create!([
  {body: 'a = {},  a = Hash.new , a= Hash[]', question_id: questions[0].id},
  {body: 'Ruby имеет динамическую, строгую, неявную типизацию', question_id: questions[1].id},
  {body: 'Для того, чтобы ссылка открывалась в новом окне используется тег <_blank>', question_id: questions[2].id},
  {body: 'В SQL можно выделить категории: DDL - Data Definition Language и DML Data Manipulation Language', question_id: questions[3].id},
  {body: 'сервер - роутер - контроллер - модель - БД - модель - контроллер - представление - контроллер - сервер', question_id: questions[4].id},
  {body: 'Ядро, системные библиотеки, системные утилиты', question_id: questions[5].id}
])
