require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    str = @nameable.correct_name
    str[0...10] if str.length > 10
  end
end
