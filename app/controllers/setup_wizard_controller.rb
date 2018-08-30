class SetupWizardController < UIViewController
  def init
    super
    @current_controller = -1
    self
  end

  def loadView
    super

    self.view = SetupWizardView.new

    @nav = UINavigationController.alloc.initWithRootViewController(next_controller)
    addChildViewController @nav

    @nav.view.frame = view.content.bounds
    view.content.addSubview @nav.view
  end

  def viewDidAppear(animated)
    super

    view.button.addTarget(self, action: 'next_step:', forControlEvents: UIControlEventTouchUpInside)
  end

  def next_step(_)
    @nav.pushViewController(next_controller, animated: true)
  end

  private

  def next_controller
    controllers[@current_controller += 1].new
  end

  def controllers
    [
      FirstStepController,
      SecondStepController,
      ThirdStepController
    ]
  end
end
