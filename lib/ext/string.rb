class String
  def colorize(num)
    "\e[#{num}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def blue
    colorize(34)
  end
end
