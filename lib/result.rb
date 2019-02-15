class Result
  def initialize(results_path)
    unless File.exist?(results_path)
      abort "Файл с результатами #{results_path} не найден."
    end

    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end

  def print(quiz)
    puts "\nВаше кол-во баллов - #{quiz.comunicate_level}. Результаты теста показали что :"
    puts
    # Вывод результатов
    case quiz.comunicate_level
    when 30..32
      puts @results[0]
    when 25..29
      puts @results[1]
    when 19..24
      puts @results[2]
    when 14..18
      puts @results[3]
    when 9..13

      puts @results[4]
    when 4..8
      puts @results[5]
    else
      puts @results[6]
    end
  end
end
