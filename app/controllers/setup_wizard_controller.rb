class SetupWizardController < UIViewController
  def init
    super
    @current_controller ||= -1
    self
  end

  def loadView
    super

    self.view = SetupWizardView.new

    @nav = UINavigationController.alloc.initWithRootViewController(next_controller)
    @nav.delegate = self
    addChildViewController @nav

    @nav.view.frame = view.content.bounds
    view.content.addSubview @nav.view
  end

  def viewDidAppear(animated)
    super

    view.button.addTarget(self, action: 'next_step:', forControlEvents: UIControlEventTouchUpInside)
  end

  def next_step(sender)
    if next_controller?
      @nav.pushViewController(next_controller, animated: true)
      show_done_button unless next_controller?
    else
      puts 'Done'
    end
  end

  def navigationController(nav, willShowViewController: vc, animated: animated)
    @current_controller = controllers.index(vc.class)
    show_next_button if next_controller?
  end

  private

  def show_done_button
    view.button.change_to_done_button
  end

  def show_next_button
    view.button.change_to_next_button
  end

  def next_controller
    controllers[@current_controller += 1].new
  end

  def next_controller?
    !controllers[@current_controller + 1].nil?
  end

  def controllers
    [
      FirstStepController,
      SecondStepController,
      ThirdStepController
    ]
  end
end
