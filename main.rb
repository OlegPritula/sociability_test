require_relative "lib/quiz"
require_relative "lib/result"

name = ARGV[0]

if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end

if name == nil
  name = "Инкогнито"
end

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

quiz = Quiz.new(questions_path)
result = Result.new(results_path)

puts "\nПривет, #{name}! Этот тест поможет определить ваш уровень коммуникабельности. " \
"Для этого необходимо правдиво ответить на следующие вопросы."

until quiz.finished?
  quiz.next_question
end

puts "\nНу что же, #{name}"
result.print(quiz)
