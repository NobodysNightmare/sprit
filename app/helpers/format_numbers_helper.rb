module FormatNumbersHelper
  def human_number(number, max_precision: 2)
    return number if number.infinite? || (number.respond_to?(:nan?) && number.nan?)
    number = number.round(max_precision)
    number = number.to_i if number.denominator == 1 && number.is_a?(Rational)
    number_with_delimiter number
  end
end
