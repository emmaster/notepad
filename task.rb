require 'Date'

class Task < Post
  def initialize
    super
    @due_date = Time.now
  end

  def read_from_console
    puts "Что надо сделать?"
    @text = STDIN.gets.chomp

    puts "К каком числу нужно сделать? Укажите в формате ДД.ММ.ГГГГ, например 12.05.2003"
    input = STDIN.gets.chomp

    @due_date = Date.parse('2001-02-03')
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"
    deadline = "Крайний срок: #{@due_date}"
    return [deadline, @text, time_string]
  end

  def to_db_hash
    return super.merge({
                           'text'=> @text,
                       'due_date' => @due_date.to_s
                       })

  end

  def load_data(data_hash)
    super(data_hash)
    @text = data_hash['text'].split('\n\r')
    @due_date = Date.parse(data_hash['due_date'])
  end
end