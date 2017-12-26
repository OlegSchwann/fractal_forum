# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.create(
  message:
    'Привет всем на Фрактальном форуме! '\
    'Здесь вы можете вести обсуждения на любую тему, '\
    'отвечая на другие сообщения. Обратитесь к любому сообщению, '\
    'что бы раскрыть ответы на 5 вглубь. Хорошего настроения!',
  login: 'Root',
  perent_comment_id: 0
)
Comment.create(
    message:
        'Обсуждение работы форума. Пишите сюда о багах.',
    login: 'Admin',
    perent_comment_id: 1
)
