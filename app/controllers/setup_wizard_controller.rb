class SetupWizardController < UIViewController
  def loadView
    super

    self.view = SetupWizardView.new
  end
end
