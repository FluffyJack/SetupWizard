class NextButton < UIButton
  def init
    super

    setBackgroundColor UIColor.blueColor
    setTitle('Next', forState: UIControlStateNormal)
    setTitleColor(UIColor.whiteColor, forState: UIControlStateNormal)

    self
  end

  def change_to_done_button
    setTitle('Done!', forState: UIControlStateNormal)
  end

  def change_to_next_button
    setTitle('Next', forState: UIControlStateNormal)
  end
end
