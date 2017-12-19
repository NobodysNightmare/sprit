module FormatNumbersHelper
  def human_number(number)
    number = number.round(2)
    number = number.to_i if number.denominator == 1
    number_with_delimiter number
  end
end
