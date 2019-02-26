class Quiz
  def initialize(questions_path)

    unless File.exist?(questions_path)
      abort "Файл с вопросами #{questions_path} не найден."
    end

    file = File.new(questions_path, "r:UTF-8")
    @questions = file.readlines
    file.close

    # Накопитель баллов
    @comunicate_level = 0
    # Номер вопроса
    @question = 0
  end

  # Конец теста
  def finished?
    @question >= @questions.size
  end

  # Следующий вопрос
  def next_question
    puts
    puts @questions[@question]

    # Ввод пользователем варианта ответа из допустимых
    user_input = nil
    until user_input == 0 || user_input == 1 || user_input == 2
      if [4, 9, 10, 12].include? (@question)
        puts "\nБудьте внимательны!!! Варианты ответов: 0 - да, 1 - иногда, 2 - нет)"
      else
        puts "\nВарианты ответов: 0 - нет, 1 - иногда, 2 - да)"
      end
      puts
      user_input = Integer(STDIN.gets) rescue nil
    end

    # Накапливаем баллы
    @comunicate_level += user_input

    # Увеличиваем номер вопроса
    @question += 1
  end

  # Геттер для накопителя баллов
  attr_accessor :comunicate_level
end
