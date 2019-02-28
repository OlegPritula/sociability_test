begin
  require_relative "lib/quiz"
  require_relative "lib/result"
rescue LoadError
  abort "Необходимый файл не найден #{$!.inspect}"
end

name = ARGV[0]

if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end

questions_path = __dir__ + "/data/questions.txt"
results_path = __dir__ + "/data/results.txt"

quiz = Quiz.new(questions_path)
result = Result.new(results_path)

system "cls"
name ||= "Инкогнито"
puts "\nПривет, #{name}! Этот тест поможет определить ваш уровень коммуникабельности. " \
  "Для этого необходимо правдиво ответить на следующие вопросы."

until quiz.finished?
  quiz.next_question
end

puts "\nНу что же, #{name}"
result.print(quiz)
