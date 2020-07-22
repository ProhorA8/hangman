class Game
  # разрешено ошибок
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    # среди всех букв введеных пользователем,
    # те из них которых нет в загаданном слове, являются ошибочными
    @user_guesses - normalized_letters
  end

  # количество ошибочных букв
  def errors_made
    errors.length
  end

  # ошибок осталось
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def normalize_letter(letter)
    case letter
    when "Ё" then"Е"
    when "Й" then"И"
    else letter
    end
  end

  # возврат буквы массива @letters каждая из которых нормализована
  def normalized_letters
    @letters.map { |letter| normalize_letter(letter) }
  end

  # слово с пропусками неотгаданных букв (массив)
  def letters_to_guess
    @letters.map do |letter|
      letter if @user_guesses.include?(normalize_letter(letter))
    end
  end

  # если остаток ошибок 0 - проигрыш
  def lost?
    errors_allowed.zero?
  end

  # окончена ли игра?
  def over?
    won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(normalize_letter(letter))
      # если игра не закончилась и нет такой буквы из названных, то закидываем букву в массив
      @user_guesses << normalize_letter(letter)
    end
  end

  def won?
    # если массив загаданного слова минус те буквы что назвал пользователь, пулучим пустой массив, то выйграли
    (normalized_letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end
end
