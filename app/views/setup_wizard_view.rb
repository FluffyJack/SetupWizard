class SetupWizardView < UIView
  attr_accessor :content
  attr_reader   :button

  def init
    super

    addSubview(@content = UIView.new)
    addSubview(@button = NextButton.new)

    @content.frame = [[0, 0], [320, 518]]
    @button.frame = [[0, 518], [320, 50]]

    self
  end
end
